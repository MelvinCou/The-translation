#ifndef SIM_CONTROLLER_THREAD_HPP
#define SIM_CONTROLLER_THREAD_HPP

#include <memory>
#include <thread>

namespace sim {
class Client;
class Controller;

/// RAII wrapper that creates and runs a simulation controller in a separate thread.
class ControllerThread {
 public:
  /// @brief Constructor - starts the thread
  explicit ControllerThread(std::shared_ptr<Client> const &client);
  /// @brief Destructor - stops and joins the thread if it is still running.
  /// Automatically calls terminateAndJoin().
  ~ControllerThread();

  std::shared_ptr<Client> const &getClient() const;
  std::shared_ptr<Controller> const &getController() const;

  /// @brief Stops the thread and waits for it to finish.
  /// Calling this function is not necessary if the ControllerThread object is destroyed.
  void terminateAndJoin();

 private:
  std::thread m_thread;
  std::shared_ptr<std::atomic<bool>> m_stopToken;
  std::shared_ptr<Client> m_client;
  std::shared_ptr<Controller> m_controller;
};
}  // namespace sim

#endif  // !defined(SIM_CONTROLLER_THREAD_HPP)
