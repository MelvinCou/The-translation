#ifndef SIMULATION_SERVER_HPP
#define SIMULATION_SERVER_HPP

#include <atomic>
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

  void pushToClient(S2CMessage &&msg);
  std::vector<char> popHttpResponse(uint32_t reqId);

  void run();

  // Actions

  void sendLcdClear();
  void sendLcdSetCursor(int16_t x, int16_t y);
  void sendLcdSetTextSize(uint8_t size);
  void sendLcdWrite(uint8_t const *buf, uint8_t len);
  void sendConveyorSetSpeed(uint32_t speed);
  void sendHttpBegin(uint32_t reqId, uint16_t port, char const *host, uint8_t hostLen);
  size_t sendHttpWrite(uint32_t reqId, char const *buf, size_t len);
  void sendHttpEnd(uint32_t reqId);
  void sendConfigSchemaReset();

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

  std::mutex m_httpResLock;
  std::atomic<bool> m_hasHttpResponses;
  std::unordered_map<uint32_t, std::vector<char>> m_httpPartialResponses;
  std::unordered_map<uint32_t, std::vector<char>> m_httpResponses;
};

#define SIM_SOCKET_PATH "/tmp/the-translation.sock"
extern SimulationServer SimServer;

#endif  // !defined(SIMULATION_SERVER_HPP)
