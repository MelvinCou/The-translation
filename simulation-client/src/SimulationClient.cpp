#include "SimulationClient.hpp"

#include <poll.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>

#include <cstdio>
#include <cstring>
#include <iostream>
#include <thread>

#define SIM_SOCKET_PATH "/tmp/the-translation.sock"

SimulationClient::SimulationClient(std::shared_ptr<std::atomic<bool>> const& stopToken)
    : m_stopToken(stopToken), m_state(State::CONNECTING), m_sockFd(-1), m_hasC2SQueuedMessages(false), m_hasS2CQueuedMessages(false) {}

void SimulationClient::pushToServer(C2SMessage&& msg) {
  //
  std::unique_lock<std::mutex> lock(m_c2sQueueLock);
  m_c2sQueue.push(std::move(msg));
  m_hasC2SQueuedMessages.store(true);
}

bool SimulationClient::popFromServer(std::vector<S2CMessage>& popped) {
  if (!m_hasS2CQueuedMessages.load()) return false;
  std::unique_lock<std::mutex> lock(m_s2cQueueLock);

  // move popped messages to the provided vector
  while (!m_s2cQueue.empty()) {
    popped.emplace_back(std::move(m_s2cQueue.front()));
    m_s2cQueue.pop();
  }

  m_hasC2SQueuedMessages.store(false);
  return true;
}

SimulationClient::State SimulationClient::getState() const { return m_state.load(std::memory_order_relaxed); }

void SimulationClient::run() {
  while (!m_stopToken->load() && step() >= 0) {
    // keep running
  }
  if (m_sockFd != -1) {
    close(m_sockFd);
  }
  printf("== CLIENT STOPPED ==\n");
}

int SimulationClient::step() {
  switch (m_state.load(std::memory_order_relaxed)) {
    case State::CONNECTING:
      return doConnect();
    case State::WAITING_FOR_IO:
      return doWaitForIO();
    case State::WRITING:
      return doWrite();
    case State::READING:
      return doRead();
    case State::PROCESSING:
      return doProcess();
  }
  return -1;
}

int SimulationClient::transitionTo(State next) {
  State prev = m_state.load(std::memory_order_relaxed);

  if (next == State::CONNECTING) {
    if (m_sockFd != -1) {
      close(m_sockFd);
    }
    m_buf.clear();
    m_sockFd = -1;
    if (prev != State::CONNECTING) {
      // push an artificial RESET message
      std::unique_lock<std::mutex> lock(m_s2cQueueLock);
      m_s2cQueue.emplace(S2CMessage{S2COpcode::RESET, {}});
      m_hasS2CQueuedMessages.store(true);
    }
  }
  m_state.store(next, std::memory_order_relaxed);
  return 0;
}

int SimulationClient::doConnect() {
  m_sockFd = socket(AF_UNIX, SOCK_STREAM, 0);

  if (m_sockFd < 0) {
    printf("Failed to create socket: %s\n", strerror(errno));
    return 0;
  }
  sockaddr_un addr{};
  memset(&addr, 0, sizeof(addr));
  addr.sun_family = AF_UNIX;
  strncpy(addr.sun_path, SIM_SOCKET_PATH, sizeof(addr.sun_path) - 1);

  printf("Connecting to server...\n");
  if (connect(m_sockFd, reinterpret_cast<sockaddr*>(&addr), sizeof(addr)) == -1) {
    printf("Failed to connect to server: %s\n", strerror(errno));
    close(m_sockFd);
    m_sockFd = -1;
    // wait for a bit before retrying
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
    return 0;
  }
  printf("Successfully connected!\n");
  return transitionTo(State::WAITING_FOR_IO);
}

int SimulationClient::doWaitForIO() {
  pollfd pfd{};
  pfd.fd = m_sockFd;
  pfd.events = POLLIN | POLLOUT;
  pfd.revents = 0;

  if (poll(&pfd, 1, 10) <= 0) {
    // IO not ready
    return 0;
  }

  if ((pfd.revents & POLLHUP) != 0) {
    printf("Connection closed by server\n");
    return transitionTo(State::CONNECTING);
  }

  if ((pfd.revents & (POLLERR | POLLNVAL)) != 0) {
    printf("Error on socket: %s\n", strerror(errno));
    return transitionTo(State::CONNECTING);
  }

  if ((pfd.revents & POLLOUT) != 0 && m_hasC2SQueuedMessages.load()) {
    return transitionTo(State::WRITING);
  }
  if ((pfd.revents & POLLIN) != 0) {
    return transitionTo(State::READING);
  }
  return 0;
}

int SimulationClient::doWrite() {
  std::unique_lock<std::mutex> lock(m_c2sQueueLock);
  while (!m_c2sQueue.empty()) {
    C2SMessage const& msg = m_c2sQueue.front();
    auto const* toWrite = reinterpret_cast<uint8_t const*>(&msg);
    size_t len = msg.length();

    printf("[SEND] %s\n", msg.name());

    while (len > 0) {
      ssize_t numBytes = send(m_sockFd, toWrite, len, MSG_NOSIGNAL);
      if (numBytes < 0) {
        printf("Failed to write message to server: %s\n", strerror(errno));
        return transitionTo(State::CONNECTING);
      }
      if (numBytes == 0) {
        printf("Wrote 0 bytes to server: %s\n", strerror(errno));
        return transitionTo(State::CONNECTING);
      }
      toWrite += numBytes;
      len -= numBytes;
    }
    m_c2sQueue.pop();
    m_hasC2SQueuedMessages.store(false);
  }
  return transitionTo(State::WAITING_FOR_IO);
}

int SimulationClient::doRead() {
  unsigned char buf[256];
  ssize_t numBytes;

  numBytes = recv(m_sockFd, buf, sizeof(buf), MSG_NOSIGNAL);

  if (numBytes < 0) {
    printf("Failed to read server message: %s\n", strerror(errno));
    return transitionTo(State::CONNECTING);
  }

  m_buf.insert(m_buf.end(), buf, buf + numBytes);
  if (numBytes == sizeof(buf)) {
    return transitionTo(State::WAITING_FOR_IO);
  }
  return transitionTo(State::PROCESSING);
}

enum NextMessageResult : int {
  S2C_MSG_ERR = -1,
  S2C_MSG_PARTIAL = 0,
  S2C_MSG_READY = 1,
};

static NextMessageResult popNextMessage(std::vector<uint8_t>& data, S2CMessage* msg) {
  if (data.empty()) {
    return S2C_MSG_PARTIAL;
  }
  uint8_t rawOpcode = data[0];
  if (rawOpcode >= static_cast<uint8_t>(S2COpcode::MAX_OPCODE)) {
    printf("Invalid opcode: %d\n", rawOpcode);
    return S2C_MSG_ERR;
  }
  size_t headerLen = S2CMessage::headerLength(static_cast<S2COpcode>(data[0]));

  // Try to read the header part
  if (data.size() < headerLen) {
    return S2C_MSG_PARTIAL;
  }
  memcpy(msg, data.data(), headerLen);
  size_t tailLen = msg->tailLength();

  // Read the rest of the message if possible
  if (data.size() - headerLen < tailLen) {
    return S2C_MSG_PARTIAL;
  }
  memcpy(reinterpret_cast<char*>(msg) + headerLen, data.data() + headerLen, tailLen);
  data.erase(data.begin(), data.begin() + headerLen + tailLen);
  return S2C_MSG_READY;
}

int SimulationClient::doProcess() {
  S2CMessage msg;

  switch (popNextMessage(m_buf, &msg)) {
    case S2C_MSG_ERR:
      return transitionTo(State::CONNECTING);
    case S2C_MSG_PARTIAL:
      return transitionTo(State::WAITING_FOR_IO);
    default:
      break;
  }

  printf("[RECV] %s\n", msg.name());

  std::unique_lock<std::mutex> lock(m_s2cQueueLock);
  m_s2cQueue.push(std::move(msg));
  m_hasS2CQueuedMessages.store(true);

  return 0;
}

void SimulationClient::sendSetButton(uint8_t id, bool pressed) {
  C2SMessage setBtnAMsg{C2SOpcode::SET_BUTTON, {}};
  setBtnAMsg.setButton.id = id;
  setBtnAMsg.setButton.value = pressed ? 1 : 0;
  pushToServer(std::move(setBtnAMsg));
}

void SimulationClient::sendReset() { pushToServer(C2SMessage{C2SOpcode::RESET, {}}); }

void SimulationClient::sendConfigSetValue(char const* name, char const* value) {
  C2SMessage msg{C2SOpcode::CONFIG_SET_VALUE, {}};

  constexpr size_t fieldMaxLen = 83;
  msg.configSetValue.nameLen = std::min(strlen(name), fieldMaxLen);
  msg.configSetValue.valueLen = std::min(strlen(value), fieldMaxLen);

  memset(msg.configSetValue.buf, 0, sizeof(msg.configSetValue.buf));
  memcpy(msg.configSetValue.buf, name, msg.configSetValue.nameLen);
  memcpy(msg.configSetValue.buf + msg.configSetValue.nameLen, value, msg.configSetValue.valueLen);
  pushToServer(std::move(msg));
}

void SimulationClient::sendConfigFullReadEnd() {
  C2SMessage msg{C2SOpcode::CONFIG_FULL_READ_END, {}};
  pushToServer(std::move(msg));
}
