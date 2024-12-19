#include "simulation/SimulationServer.hpp"

#include <esp_log.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>

#include <cerrno>
#include <cstdlib>
#include <vector>

SimulationServer SimServer;

SimulationServer::SimulationServer() : m_state(State::IDLE), m_serverFd(-1), m_clientFd(-1) {}

void SimulationServer::registerButton(int id, std::shared_ptr<std::atomic<bool>> const &isPressed) {
  switch (id) {
    case 0:
      m_btnAIsPressed = isPressed;
      break;
    case 1:
      m_btnBIsPressed = isPressed;
      break;
    case 2:
      m_btnCIsPressed = isPressed;
      break;
    default:
      break;
  }
}

void SimulationServer::pushToClient(S2CMessage &&msg) {
  std::unique_lock<std::mutex> lock(m_queueLock);
  m_queue.push(std::move(msg));
  lock.unlock();
  m_hasQueuedMessages.store(true);
}

#define TAG "SimServer"

void SimulationServer::run() {
  while (step() >= 0) {
    //
  }
  ESP_LOGE(TAG, "!!! EXITING SIMULATION SERVER !!!");
}

int SimulationServer::step() {
  switch (m_state) {
    case State::IDLE:
      return doOpen();
    case State::LISTENING:
      return doListen();
    case State::READING:
      return doRead();
    case State::PROCESSING:
      return doProcess();
  }
  return -1;
}

int SimulationServer::transitionTo(State next) {
  State prev = m_state;
  ESP_LOGV(TAG, "Transitioning from %d to %d", static_cast<int>(prev), static_cast<int>(next));

  if (next == State::LISTENING) {
    if (m_clientFd != -1) {
      close(m_clientFd);
    }
    m_buf.clear();
    m_clientFd = -1;
  }
  m_state = next;
  return 0;
}

#define TAG "SimServer"

int SimulationServer::doOpen() {
  if (m_serverFd == -1) {
    close(m_serverFd);
  }

  sockaddr_un serverAddr{};

  // Create a Unix domain socket
  m_serverFd = socket(AF_UNIX, SOCK_STREAM, 0);
  if (m_serverFd < 0) {
    ESP_LOGE(TAG, "Failed to create socket: %s", strerror(errno));
    return -1;
  }

  // Set up the server address structure
  memset(&serverAddr, 0, sizeof(serverAddr));
  serverAddr.sun_family = AF_UNIX;
  strncpy(serverAddr.sun_path, SIM_SOCKET_PATH, sizeof(serverAddr.sun_path) - 1);

  // Remove any existing socket file
  unlink(SIM_SOCKET_PATH);

  // Bind the socket to the address
  if (bind(m_serverFd, reinterpret_cast<sockaddr *>(&serverAddr), sizeof(serverAddr)) < 0) {
    ESP_LOGE(TAG, "Failed to bind to socket at %s: %s", SIM_SOCKET_PATH, strerror(errno));
    close(m_serverFd);
    return -1;
  }

  // Set m_serverFd to non-blocking
  int flags = fcntl(m_serverFd, F_GETFL, 0);
  if (fcntl(m_serverFd, F_SETFL, flags | O_NONBLOCK) < 0) {
    ESP_LOGE(TAG, "Failed to set socket to non-blocking: %s", strerror(errno));
    close(m_serverFd);
    return -1;
  }

  // Accept one connection at a time
  if (listen(m_serverFd, 1) < 0) {
    ESP_LOGI(TAG, "Failed to listen to socket at %s: %s", SIM_SOCKET_PATH, strerror(errno));
    close(m_serverFd);
    return -1;
  }

  signal(SIGPIPE, SIG_IGN);

  ESP_LOGI(TAG, "Simulation server listening on %s", SIM_SOCKET_PATH);
  return transitionTo(State::LISTENING);
}

int SimulationServer::doListen() {
  sockaddr_un clientAddr{};
  socklen_t clientAddrLen;

  do {
    clientAddrLen = sizeof(clientAddr);
    m_clientFd = accept(m_serverFd, reinterpret_cast<sockaddr *>(&clientAddr), &clientAddrLen);
    if (m_clientFd < 0 && errno != EWOULDBLOCK) {
      ESP_LOGE(TAG, "Failed to accept client: %s", strerror(errno));
      return transitionTo(State::LISTENING);
    }
    if (m_clientFd >= 0) {
      int flags = fcntl(m_clientFd, F_GETFL, 0);
      if (fcntl(m_clientFd, F_SETFL, flags | O_NONBLOCK) < 0) {
        ESP_LOGW(TAG, "Failed to set client to non-blocking: %s", strerror(errno));
        return transitionTo(State::LISTENING);
      }
    }
  } while (m_clientFd < 0);
  return transitionTo(State::READING);
}

int SimulationServer::doRead() {
  unsigned char buf[256];
  size_t offset = 0;
  ssize_t numBytes;

  tryPushQueuedMessage();
  do {
    numBytes = read(m_clientFd, buf + offset, sizeof(buf) - offset);

    if (numBytes < 0) {
      if (errno == EWOULDBLOCK) continue;
      ESP_LOGW(TAG, "Failed to read client message: %s", strerror(errno));
      return transitionTo(State::LISTENING);
    }
    if (numBytes == 0) {
      ESP_LOGW(TAG, "Empty message from client");
      return transitionTo(State::LISTENING);
    }
    offset += numBytes;
    m_buf.insert(m_buf.end(), buf, buf + numBytes);
  } while (numBytes == sizeof(buf));

  return transitionTo(State::PROCESSING);
}

static int writeMessage(int clientFd, S2CMessage const *msg) {
  auto const *toWrite = reinterpret_cast<uint8_t const *>(msg);
  size_t len = msg->getLength();

  while (len > 0) {
    ssize_t numBytes = write(clientFd, toWrite, len);
    if (numBytes < 0) {
      if (errno == EWOULDBLOCK) continue;
      ESP_LOGW(TAG, "Failed to write message to client: %s", strerror(errno));
      return -1;
    }
    if (numBytes == 0) {
      ESP_LOGW(TAG, "Wrote 0 bytes to client: %s", strerror(errno));
      return -1;
    }
    toWrite += numBytes;
    len -= numBytes;
  }
  return 0;
}

void SimulationServer::tryPushQueuedMessage() {
  if (!m_hasQueuedMessages.load()) return;
  std::unique_lock<std::mutex> lock(m_queueLock);
  while (!m_queue.empty()) {
    S2CMessage const &msg = m_queue.front();
    if (writeMessage(m_clientFd, &msg) >= 0) {
      m_queue.pop();
    }
  }
  m_hasQueuedMessages.store(!m_queue.empty());
}

enum NextMessageResult : int {
  C2S_MSG_ERR = -1,
  C2S_MSG_PARTIAL = 0,
  C2S_MSG_READY = 1,
};

static NextMessageResult popNextMessage(std::vector<uint8_t> &data, C2SMessage *msg) {
  if (data.empty()) {
    return C2S_MSG_PARTIAL;
  }
  uint8_t rawOpcode = data[0];
  if (rawOpcode >= static_cast<uint8_t>(C2SOpcode::MAX_OPCODE)) {
    ESP_LOGW(TAG, "Invalid opcode: %d", rawOpcode);
    return C2S_MSG_ERR;
  }
  msg->opcode = static_cast<C2SOpcode>(data[0]);
  size_t len = msg->getLength();

  if (data.size() < len) {
    return C2S_MSG_PARTIAL;
  }
  memcpy(msg, data.data(), len);
  data.erase(data.begin(), data.begin() + len);
  return C2S_MSG_READY;
}

int SimulationServer::doProcess() {
  C2SMessage msg;

  switch (popNextMessage(m_buf, &msg)) {
    case C2S_MSG_ERR:
      return transitionTo(State::LISTENING);
    case C2S_MSG_PARTIAL:
      return transitionTo(State::READING);
    default:
      break;
  }

  if (msg.opcode == C2SOpcode::SET_BUTTON) {
    ESP_LOGI(TAG, "Setting button %d to %d", msg.setButton.id, msg.setButton.value);
    switch (msg.setButton.id) {
      case 0:
        m_btnAIsPressed->store(msg.setButton.value != 0);
        break;
      case 1:
        m_btnBIsPressed->store(msg.setButton.value != 0);
        break;
      case 2:
        m_btnCIsPressed->store(msg.setButton.value != 0);
        break;
      default:
        break;
    }
  } else if (msg.opcode == C2SOpcode::RESET) {
    close(m_clientFd);
    close(m_serverFd);
    exit(0);
  }
  return 0;
}
