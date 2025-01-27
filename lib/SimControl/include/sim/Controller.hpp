#ifndef SIM_CONTROLLER
#define SIM_CONTROLLER

#include <atomic>
#include <chrono>
#include <condition_variable>
#include <functional>
#include <memory>
#include <mutex>

#include "sim/Configuration.hpp"
#include "sim/HardwareState.hpp"
#include "sim/Message.hpp"

namespace sim {
class Client;

/// @brief The Controller is responsible for managing and piloting the simulation status.
/// For the GUI app: the status of the simulation is displayed on the screen and the user can interact with it.
/// For tests: the controller is run in a separate thread and the test can interact with the simulation through the controller.
class Controller {
 public:
  using ReceiveHandler = std::function<void(Controller &, S2CMessage const &)>;

  explicit Controller(std::shared_ptr<Client> const &client, std::shared_ptr<std::atomic<bool>> const &stopToken, float screenScale = 1.0f);

  /// @brief Runs indefinitely until the stop token is set, repeatedly calling the step function.
  void run();
  /// @brief Performs a single step of the simulation.
  void step();

  Client const &getClient() const { return *m_client; }
  constexpr Configuration const &getConfig() const { return m_config; }
  constexpr HardwareState const &getHardwareState() const { return m_hw; }
  Client &getClient() { return *m_client; }
  Configuration &getConfig() { return m_config; }
  HardwareState &getHardwareState() { return m_hw; }

  /// @brief Blocks the current thread until the client is connected or the
  /// @return true if the client is connected, false if the timeout was reached
  bool awaitConnection(std::chrono::milliseconds timeout = std::chrono::seconds(5));

  /// @brief Blocks the current thread until the simulation is fully initialized and ready to receive messages.
  /// @return true when ready, false if the timeout was reached
  bool awaitSimulationReady(std::chrono::milliseconds timeout = std::chrono::seconds(2));

  /// @brief Registers a permanent message handler for a specific opcode
  void onReceive(S2COpcode opcode, ReceiveHandler &&handler);
  /// @brief Registers a temporary message handler for a specific opcode
  void onReceiveOnce(S2COpcode opcode, ReceiveHandler &&handler);
  /// @brief Register built-in message handlers
  void registerDefaultReceiveHandlers();
  /// @brief A testing utility that waits for a specific message to be received after calling the given `scope` function.
  ///
  /// @param opcode The expected opcode of the message.
  /// @param scope A function that will be called before waiting for the message, typically used to trigger the message to be sent from the
  /// other side (e.g. by pressing a button).
  /// @param msg[out] A pointer to a message object that will be filled with the received message, or nullptr if the message is not needed.
  /// @param timeout The maximum time to wait for the message.
  /// @return true if the message was received, false if the timeout was reached in which case the message object will not be filled.
  bool expectReceive(S2COpcode opcode, std::function<void()> const &scope, S2CMessage *msg = nullptr,
                     std::chrono::milliseconds timeout = std::chrono::seconds(1));

  /// @brief Presses a button for a specified duration
  void pressButton(uint8_t id, std::chrono::milliseconds duration = std::chrono::milliseconds(50));

 private:
  std::shared_ptr<Client> m_client;
  std::mutex m_notifyLock;
  std::condition_variable m_notifyVar;
  std::atomic<bool> m_awaitingConnection;

  std::shared_ptr<std::atomic<bool>> m_stopToken;
  std::unordered_map<S2COpcode, ReceiveHandler> m_handlers;
  std::unordered_map<S2COpcode, ReceiveHandler> m_handlersOnce;

  Configuration m_config;
  HardwareState m_hw;
};
}  // namespace sim

#endif  // !defined(SIM_CONTROLLER)
