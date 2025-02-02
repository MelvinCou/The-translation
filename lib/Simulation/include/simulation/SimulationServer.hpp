#ifndef SIMULATION_SERVER_HPP
#define SIMULATION_SERVER_HPP

#include <atomic>
#include <functional>
#include <memory>
#include <mutex>
#include <queue>
#include <unordered_map>
#include <vector>

#include "simulation/SimulationMessage.hpp"

class SimulationServer {
 public:
  SimulationServer();

  void registerButton(int id, std::shared_ptr<std::atomic<bool>> const &isPressed);
  void registerNfc(I2CAddress addr, std::function<void(C2SMessage const &)> handler);
  void registerWifiOnSetModeAck(std::function<void()> handler);
  void registerWifiOnConnectResponse(std::function<void(int)> handler);
  void registerHttpOnResponse(std::function<void(uint32_t, std::vector<char>)> handler);
  void registerEolSensorOnSetDistance(std::function<void(float)> handler);

  void pushToClient(S2CMessage &&msg);
  bool popConfigRead(C2SMessage &msg);

  void run();

  // Actions

  void sendLcdClear();
  void sendLcdSetCursor(int16_t x, int16_t y);
  void sendLcdSetTextSize(uint8_t size);
  void sendLcdSetTextColor(uint16_t color);
  void sendLcdWrite(uint8_t const *buf, uint8_t len);
  void sendConveyorSetSpeed(uint32_t speed);
  void sendHttpBegin(uint32_t reqId, uint16_t port, char const *host, uint8_t hostLen);
  size_t sendHttpWrite(uint32_t reqId, char const *buf, size_t len);
  void sendHttpEnd(uint32_t reqId);
  void sendConfigSchemaReset();
  void sendConfigSchemaDefine(uint8_t type, char const *name, char const *label, char const *def);
  void sendConfigEndDefine();
  void sendConfigSetExposed(bool exposed);
  void sendConfigFullReadBegin();
  void sendNfcGetVersion(I2CAddress addr);
  void sendSorterSetAngle(uint32_t angle);
  void sendWifiSetMode(int mode);
  void sendWifiConnect(char const *ssid, char const *pass);

 private:
  // server state machine
  enum class State {
    IDLE,
    LISTENING,
    READING,
    PROCESSING,
  };

  int step();
  int transitionTo(State next);

  int doOpen();
  int doListen();
  int doRead();
  int doProcess();

  void tryPushQueuedMessage();

  State m_state;
  int m_serverFd;
  int m_clientFd;
  std::vector<uint8_t> m_buf;

  std::shared_ptr<std::atomic<bool>> m_btnAIsPressed;
  std::shared_ptr<std::atomic<bool>> m_btnBIsPressed;
  std::shared_ptr<std::atomic<bool>> m_btnCIsPressed;

  std::mutex m_queueLock;
  std::atomic<bool> m_hasQueuedMessages;
  std::queue<S2CMessage> m_queue;

  std::unordered_map<uint32_t, std::vector<char>> m_httpPartialResponses;

  std::mutex m_configReadLock;
  std::atomic<bool> m_hasQueuedConfigRead;
  std::queue<C2SMessage> m_configReadQueue;

  std::mutex m_nfcLock;
  std::unordered_map<uint16_t, std::function<void(C2SMessage const &)>> m_nfcHandlers;

  std::function<void()> m_wifiOnSetModeAckHandler;
  std::function<void(int)> m_wifiOnConnectResponseHandler;
  std::function<void(uint32_t, std::vector<char>)> m_httpOnResponseHandler;
  std::function<void(float)> m_eolSensorOnSetDistanceHandler;
};

#define SIM_SOCKET_PATH "/tmp/the-translation.sock"
extern SimulationServer SimServer;

#endif  // !defined(SIMULATION_SERVER_HPP)
