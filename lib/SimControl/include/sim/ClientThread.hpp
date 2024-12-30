#ifndef SIM_CLIENT_THREAD_HPP
#define SIM_CLIENT_THREAD_HPP

#include <memory>
#include <thread>

namespace sim {
class Client;

class ClientThread {
 public:
  /// @brief Constructor - starts the thread
  ClientThread();
  /// @brief Destructor - stops and joins the thread if it is still running
  ~ClientThread();

  Client &getClient();
  void terminateAndJoin();

 private:
  std::thread m_thread;
  std::shared_ptr<std::atomic<bool>> m_stopToken;
  std::shared_ptr<sim::Client> m_client;
};
}  // namespace sim

#endif  // !defined(SIM_CLIENT_THREAD_HPP)
