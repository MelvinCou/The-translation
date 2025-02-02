#ifndef SIM_CLIENT_THREAD_HPP
#define SIM_CLIENT_THREAD_HPP

#include <memory>
#include <thread>

namespace sim {
class Client;

/// RAII wrapper that creates and runs a simulation client in a separate thread.
class ClientThread {
 public:
  /// @brief Constructor - starts the thread
  ClientThread();
  /// @brief Destructor - stops and joins the thread if it is still running.
  /// Automatically calls terminateAndJoin().
  ~ClientThread();

  std::shared_ptr<Client> const &getClient() const;

  /// @brief Stops the thread and waits for it to finish.
  /// Calling this function is not necessary if the ClientThread object is destroyed.
  void terminateAndJoin();

 private:
  std::thread m_thread;
  std::shared_ptr<std::atomic<bool>> m_stopToken;
  std::shared_ptr<Client> m_client;
};
}  // namespace sim

#endif  // !defined(SIM_CLIENT_THREAD_HPP)
