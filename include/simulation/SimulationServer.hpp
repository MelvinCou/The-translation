#ifndef SIMULATION_SERVER_HPP
#define SIMULATION_SERVER_HPP

#include <atomic>
#include <memory>
#include <mutex>
#include <queue>
#include <vector>

#include "simulation/SimulationMessage.hpp"

class SimulationServer {
 public:
  SimulationServer();

  void registerButton(int id, std::shared_ptr<std::atomic<bool>> const &isPressed);

  void pushToClient(S2CMessage &&msg);

  void run();

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
};

#define SIM_SOCKET_PATH "/tmp/the-translation.sock"
extern SimulationServer SimServer;

#endif  // !defined(SIMULATION_SERVER_HPP)