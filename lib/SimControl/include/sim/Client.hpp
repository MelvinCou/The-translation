#ifndef SIM_CLIENT_HPP
#define SIM_CLIENT_HPP

#include <atomic>
#include <memory>
#include <mutex>
#include <queue>

#include "WiFiEnums.hpp"
#include "sim/Message.hpp"

namespace sim {
class Client {
 public:
  enum class State {
    CONNECTING,
    WAITING_FOR_IO,
    WRITING,
    READING,
    PROCESSING,
  };
  explicit Client(std::shared_ptr<std::atomic<bool>> const &stopToken);
  void pushToServer(C2SMessage &&msg);
  bool popFromServer(std::vector<S2CMessage> &popped);
  State getState() const;

  void run();

  // Actions

  void sendSetButton(uint8_t id, bool pressed);
  void sendReset();
  void sendConfigSetValue(char const *name, char const *value);
  void sendConfigFullReadEnd();
  void sendNfcSetVersion(I2CAddress addr, uint8_t version);
  void sendNfcSetCard(I2CAddress addr, char const *card, size_t len);
  void sendWifiSetModeAck();
  void sendWifiConnectResponse(wl_status_t status);

 private:
  std::shared_ptr<std::atomic<bool>> m_stopToken;

  std::atomic<State> m_state;
  int m_sockFd;
  std::vector<uint8_t> m_buf;

  std::mutex m_c2sQueueLock;
  std::atomic<bool> m_hasC2SQueuedMessages;
  std::queue<C2SMessage> m_c2sQueue;

  std::mutex m_s2cQueueLock;
  std::atomic<bool> m_hasS2CQueuedMessages;
  std::queue<S2CMessage> m_s2cQueue;

  int step();
  int transitionTo(State next);

  int doConnect();
  int doWaitForIO();
  int doWrite();
  int doRead();
  int doProcess();
};
}  // namespace sim

#endif  // !defined(SIM_CLIENT_HPP)
