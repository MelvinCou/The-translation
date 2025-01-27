#include "simulation/SimulationServer.hpp"

#include <esp_log.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>

#include <cerrno>
#include <cstdlib>
#include <utility>
#include <vector>

#define TAG "SimServer"

SimulationServer SimServer;

SimulationServer::SimulationServer()
    : m_state(State::IDLE),
      m_serverFd(-1),
      m_clientFd(-1),
      m_hasQueuedMessages(false),
      m_hasQueuedConfigRead(false),
      m_wifiOnSetModeAckHandler([] {}),
      m_wifiOnConnectResponseHandler([](int) {}),
      m_httpOnResponseHandler([](uint32_t, std::vector<char>) {}),
      m_eolSensorOnSetDistanceHandler([](float) {}) {}

void SimulationServer::registerButton(int id, std::shared_ptr<std::atomic<bool>> const& isPressed) {
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

void SimulationServer::registerNfc(I2CAddress addr, std::function<void(C2SMessage const&)> handler) {
  std::unique_lock<std::mutex> lock(m_nfcLock);
  m_nfcHandlers[static_cast<uint16_t>(addr)] = std::move(handler);
}

void SimulationServer::registerWifiOnSetModeAck(std::function<void()> handler) { m_wifiOnSetModeAckHandler = std::move(handler); }

void SimulationServer::registerWifiOnConnectResponse(std::function<void(int)> handler) {
  m_wifiOnConnectResponseHandler = std::move(handler);
}

void SimulationServer::registerHttpOnResponse(std::function<void(uint32_t, std::vector<char>)> handler) {
  m_httpOnResponseHandler = std::move(handler);
}

void SimulationServer::registerEolSensorOnSetDistance(std::function<void(float)> handler) {
  m_eolSensorOnSetDistanceHandler = std::move(handler);
}

void SimulationServer::pushToClient(S2CMessage&& msg) {
  std::unique_lock<std::mutex> lock(m_queueLock);
  m_queue.push(std::move(msg));
  lock.unlock();
  m_hasQueuedMessages.store(true);
}

bool SimulationServer::popConfigRead(C2SMessage& msg) {
  if (!m_hasQueuedConfigRead.load()) return false;
  std::unique_lock<std::mutex> lock(m_configReadLock);

  bool hasValue = false;
  if (!m_configReadQueue.empty()) {
    msg = std::move(m_configReadQueue.front());
    m_configReadQueue.pop();
    hasValue = true;
  }
  m_hasQueuedConfigRead.store(!m_configReadQueue.empty());
  return hasValue;
}

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
      ESP_LOGW(TAG, "Closing client connection");
      close(m_clientFd);
    }
    m_buf.clear();
    m_clientFd = -1;
  }
  m_state = next;
  return 0;
}

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
  if (bind(m_serverFd, reinterpret_cast<sockaddr*>(&serverAddr), sizeof(serverAddr)) < 0) {
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
    m_clientFd = accept(m_serverFd, reinterpret_cast<sockaddr*>(&clientAddr), &clientAddrLen);
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
  ESP_LOGI(TAG, "Accepted client connection");
  return transitionTo(State::READING);
}

int SimulationServer::doRead() {
  unsigned char buf[256];
  size_t offset = 0;
  ssize_t numBytes;

  tryPushQueuedMessage();
  do {
    numBytes = recv(m_clientFd, buf + offset, sizeof(buf) - offset, MSG_NOSIGNAL | MSG_DONTWAIT);

    if (numBytes < 0) {
      if (errno == EWOULDBLOCK) continue;
      ESP_LOGW(TAG, "Failed to read client message: %s", strerror(errno));
      return transitionTo(State::LISTENING);
    }
    if (numBytes == 0) {
      char peekBuf;
      if (recv(m_clientFd, &peekBuf, 1, MSG_PEEK | MSG_NOSIGNAL | MSG_DONTWAIT) == 0) {
        ESP_LOGW(TAG, "Client disconnected");
        return transitionTo(State::LISTENING);
      }
      return 0;
    }
    offset += numBytes;
    m_buf.insert(m_buf.end(), buf, buf + numBytes);
  } while (numBytes == sizeof(buf));

  return transitionTo(State::PROCESSING);
}

static int writeMessage(int clientFd, S2CMessage const* msg) {
  auto const* toWrite = reinterpret_cast<uint8_t const*>(msg);
  size_t len = msg->length();

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
    S2CMessage const& msg = m_queue.front();
    ESP_LOGD(TAG, "[SEND/S] %s", msg.name());
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

static NextMessageResult popNextMessage(std::vector<uint8_t>& data, C2SMessage* msg) {
  if (data.empty()) {
    return C2S_MSG_PARTIAL;
  }
  uint8_t rawOpcode = data[0];
  if (rawOpcode >= static_cast<uint8_t>(C2SOpcode::MAX_OPCODE)) {
    ESP_LOGW(TAG, "Invalid opcode: %d", rawOpcode);
    return C2S_MSG_ERR;
  }
  size_t headerLen = C2SMessage::headerLength(static_cast<C2SOpcode>(data[0]));

  // Try to read the header part
  if (data.size() < headerLen) {
    return C2S_MSG_PARTIAL;
  }
  memcpy(msg, data.data(), headerLen);
  size_t tailLen = msg->tailLength();

  // Read the rest of the message if possible
  if (data.size() - headerLen < tailLen) {
    return C2S_MSG_PARTIAL;
  }
  memcpy(reinterpret_cast<char*>(msg) + headerLen, data.data() + headerLen, tailLen);
  data.erase(data.begin(), data.begin() + headerLen + tailLen);
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

  ESP_LOGD(TAG, "[RECV/S] %s", msg.name());

  if (msg.opcode == C2SOpcode::SET_BUTTON) {
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
    ESP_LOGW(TAG, "Reset message received, closing server");
    close(m_clientFd);
    close(m_serverFd);
    exit(0);
  } else if (msg.opcode == C2SOpcode::HTTP_BEGIN) {
    m_httpPartialResponses[msg.httpBegin.reqId] = {};
  } else if (msg.opcode == C2SOpcode::HTTP_WRITE) {
    auto res = m_httpPartialResponses.find(msg.httpWrite.reqId);

    if (res == m_httpPartialResponses.end()) {
      ESP_LOGW(TAG, "Received HTTP_WRITE for unknown request %u", msg.httpWrite.reqId);
      return 0;
    }
    res->second.insert(res->second.end(), msg.httpWrite.buf, msg.httpWrite.buf + msg.httpWrite.len);
  } else if (msg.opcode == C2SOpcode::HTTP_END) {
    m_httpOnResponseHandler(msg.httpEnd.reqId, m_httpPartialResponses[msg.httpEnd.reqId]);
    m_httpPartialResponses.erase(msg.httpEnd.reqId);
  } else if (msg.opcode == C2SOpcode::CONFIG_SET_VALUE || msg.opcode == C2SOpcode::CONFIG_FULL_READ_END) {
    std::unique_lock<std::mutex> lock(m_configReadLock);
    m_configReadQueue.emplace(std::move(msg));
    m_hasQueuedConfigRead.store(true);
  } else if (msg.opcode == C2SOpcode::NFC_SET_VERSION || msg.opcode == C2SOpcode::NFC_SET_CARD) {
    std::unique_lock<std::mutex> lock(m_nfcLock);
    auto handler = m_nfcHandlers.find(static_cast<uint16_t>(msg.nfcSetVersion.addr));
    if (handler != m_nfcHandlers.end()) {
      handler->second(msg);
    } else {
      ESP_LOGW(TAG, "Received NFC message %s for unknown address %02x:%02x", msg.name(), msg.nfcSetVersion.addr.busId,
               msg.nfcSetVersion.addr.addr);
    }
  } else if (msg.opcode == C2SOpcode::WIFI_SET_MODE_ACK) {
    m_wifiOnSetModeAckHandler();
  } else if (msg.opcode == C2SOpcode::WIFI_CONNECT_RESPONSE) {
    m_wifiOnConnectResponseHandler(msg.wifiConnectResponse);
  } else if (msg.opcode == C2SOpcode::EOL_SENSOR_SET_DISTANCE) {
    m_eolSensorOnSetDistanceHandler(msg.eolSensorSetDistance);
  }
  return 0;
}

void SimulationServer::sendLcdClear() {
  S2CMessage msg{S2COpcode::LCD_CLEAR, {}};
  pushToClient(std::move(msg));
}

void SimulationServer::sendLcdSetCursor(int16_t x, int16_t y) {
  S2CMessage msg{S2COpcode::LCD_SET_CURSOR, {}};
  msg.lcdSetCursor.x = x;
  msg.lcdSetCursor.y = y;
  pushToClient(std::move(msg));
}

void SimulationServer::sendLcdSetTextSize(uint8_t size) {
  S2CMessage msg{S2COpcode::LCD_SET_TEXT_SIZE, {}};
  msg.lcdSetTextSize = size;
  pushToClient(std::move(msg));
}

void SimulationServer::sendLcdSetTextColor(uint16_t color) {
  S2CMessage msg{S2COpcode::LCD_SET_TEXT_COLOR, {}};
  msg.lcdSetTextColor = color;
  pushToClient(std::move(msg));
}

void SimulationServer::sendLcdWrite(uint8_t const* buf, uint8_t len) {
  S2CMessage msg{S2COpcode::LCD_WRITE, {}};
  msg.lcdWrite.len = len;
  memset(msg.lcdWrite.buf, 0, sizeof(msg.lcdWrite.buf));
  memcpy(msg.lcdWrite.buf, buf, len);
  pushToClient(std::move(msg));
}

void SimulationServer::sendConveyorSetSpeed(uint32_t speed) {
  S2CMessage msg{S2COpcode::CONVEYOR_SET_SPEED, {}};
  msg.conveyorSetSpeed = speed;
  pushToClient(std::move(msg));
}

void SimulationServer::sendHttpBegin(uint32_t reqId, uint16_t port, char const* host, uint8_t hostLen) {
  S2CMessage msg{S2COpcode::HTTP_BEGIN, {}};
  msg.httpBegin.reqId = reqId;
  msg.httpBegin.port = port;
  msg.httpBegin.len = std::min(static_cast<size_t>(hostLen), sizeof(msg.httpBegin.host));
  memset(msg.httpBegin.host, 0, sizeof(msg.httpBegin.host));
  memcpy(msg.httpBegin.host, host, msg.httpBegin.len);
  pushToClient(std::move(msg));
}

size_t SimulationServer::sendHttpWrite(uint32_t reqId, char const* buf, size_t len) {
  S2CMessage msg{S2COpcode::HTTP_WRITE, {}};
  msg.httpWrite.reqId = reqId;
  msg.httpWrite.len = std::min(len, sizeof(msg.httpWrite.buf));
  memset(msg.httpWrite.buf, 0, sizeof(msg.httpWrite.buf));
  memcpy(msg.httpWrite.buf, buf, msg.httpWrite.len);
  pushToClient(std::move(msg));
  return msg.httpWrite.len;
}

void SimulationServer::sendHttpEnd(uint32_t reqId) {
  S2CMessage msg{S2COpcode::HTTP_END, {}};
  msg.httpEnd.reqId = reqId;
  pushToClient(std::move(msg));
}

void SimulationServer::sendConfigSchemaReset() {
  S2CMessage msg{S2COpcode::CONFIG_SCHEMA_RESET, {}};
  pushToClient(std::move(msg));
}

void SimulationServer::sendConfigSchemaDefine(uint8_t type, char const* name, char const* label, char const* def) {
  S2CMessage msg{S2COpcode::CONFIG_SCHEMA_DEFINE, {}};
  msg.configSchemaDefine.type = type;
  constexpr size_t fieldMaxLen = 83;
  msg.configSchemaDefine.nameLen = std::min(strlen(name), fieldMaxLen);
  msg.configSchemaDefine.labelLen = std::min(strlen(label), fieldMaxLen);
  msg.configSchemaDefine.defaultLen = std::min(strlen(def), fieldMaxLen);
  memset(msg.configSchemaDefine.buf, 0, sizeof(msg.configSchemaDefine.buf));
  memcpy(msg.configSchemaDefine.buf, name, msg.configSchemaDefine.nameLen);
  memcpy(msg.configSchemaDefine.buf + msg.configSchemaDefine.nameLen, label, msg.configSchemaDefine.labelLen);
  memcpy(msg.configSchemaDefine.buf + msg.configSchemaDefine.nameLen + msg.configSchemaDefine.labelLen, def,
         msg.configSchemaDefine.defaultLen);
  pushToClient(std::move(msg));
}

void SimulationServer::sendConfigEndDefine() {
  S2CMessage msg{S2COpcode::CONFIG_SCHEMA_END_DEFINE, {}};
  pushToClient(std::move(msg));
}

void SimulationServer::sendConfigSetExposed(bool exposed) {
  S2CMessage msg{S2COpcode::CONFIG_SET_EXPOSED, {}};
  msg.configSetExposed = exposed;
  pushToClient(std::move(msg));
}

void SimulationServer::sendConfigFullReadBegin() {
  S2CMessage msg{S2COpcode::CONFIG_FULL_READ_BEGIN, {}};
  pushToClient(std::move(msg));
}

void SimulationServer::sendNfcGetVersion(I2CAddress addr) {
  S2CMessage msg{S2COpcode::NFC_GET_VERSION, {}};
  msg.nfcInitBegin = addr;
  pushToClient(std::move(msg));
}

void SimulationServer::sendSorterSetAngle(uint32_t angle) {
  S2CMessage msg{S2COpcode::SORTER_SET_ANGLE, {}};
  msg.sorterSetAngle = angle;
  pushToClient(std::move(msg));
}

void SimulationServer::sendWifiSetMode(int mode) {
  S2CMessage msg{S2COpcode::WIFI_SET_MODE, {}};
  msg.wifiSetMode = mode;
  pushToClient(std::move(msg));
}

void SimulationServer::sendWifiConnect(char const* ssid, char const* pass) {
  S2CMessage msg{S2COpcode::WIFI_CONNECT, {}};
  constexpr size_t fieldMaxLen = 128;
  msg.wifiConnect.ssidLen = std::min(strlen(ssid), fieldMaxLen);
  msg.wifiConnect.passLen = std::min(strlen(pass), fieldMaxLen);
  memset(msg.wifiConnect.buf, 0, sizeof(msg.wifiConnect.buf));
  memcpy(msg.wifiConnect.buf, ssid, msg.wifiConnect.ssidLen);
  memcpy(msg.wifiConnect.buf + msg.wifiConnect.ssidLen, pass, msg.wifiConnect.passLen);
  ESP_LOGW(TAG, "Sending wifi connect message: [%s] [%s]", ssid, pass);
  pushToClient(std::move(msg));
}
