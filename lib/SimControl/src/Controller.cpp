#include "sim/Controller.hpp"

#include <thread>

#include "sim/Client.hpp"

sim::Controller::Controller(std::shared_ptr<Client> const &client, std::shared_ptr<std::atomic<bool>> const &stopToken, float screenScale)
    : m_client(client), m_stopToken(stopToken), m_hw(screenScale) {}

void sim::Controller::run() {
  while (!m_stopToken->load()) {
    step();
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
  }
}

void sim::Controller::step() {
  if (m_awaitingConnection.load() && m_client->getState() != Client::State::CONNECTING) {
    std::unique_lock<std::mutex> lock(m_notifyLock);
    m_awaitingConnection.store(false);
    m_notifyVar.notify_all();
  }

  std::vector<S2CMessage> messages;
  if (m_client->popFromServer(messages)) {
    for (auto const &msg : messages) {
      auto const handlerOnce = m_handlersOnce.find(msg.opcode);
      if (handlerOnce != m_handlersOnce.end()) {
        handlerOnce->second(*this, msg);
        m_handlersOnce.erase(handlerOnce);
      }

      auto const handler = m_handlers.find(msg.opcode);
      if (handler != m_handlers.end()) {
        handler->second(*this, msg);
      }
    }
  }
}

bool sim::Controller::awaitConnection(std::chrono::milliseconds const timeout) {
  std::unique_lock<std::mutex> lock(m_notifyLock);
  m_awaitingConnection.store(true);
  return m_notifyVar.wait_for(lock, timeout, [this] { return m_client->getState() != Client::State::CONNECTING; });
}

void sim::Controller::onReceive(S2COpcode opcode, ReceiveHandler &&handler) { m_handlers[opcode] = handler; }

void sim::Controller::onReceiveOnce(S2COpcode opcode, ReceiveHandler &&handler) { m_handlersOnce[opcode] = handler; }

void sim::Controller::registerDefaultReceiveHandlers() {
  onReceive(S2COpcode::CONFIG_SCHEMA_RESET, [](Controller &c, S2CMessage const &) { c.getConfig().resetSchema(); });
  onReceive(S2COpcode::CONFIG_SCHEMA_DEFINE, [](Controller &c, S2CMessage const &msg) { c.getConfig().define(msg); });
  onReceive(S2COpcode::CONFIG_SCHEMA_END_DEFINE, [](Controller &c, S2CMessage const &) {
    c.getConfig().loadFromFile(CONFIG_DEFAULT_PATH);
    c.getConfig().saveToFile(CONFIG_DEFAULT_PATH);
  });
  onReceive(S2COpcode::CONFIG_SET_EXPOSED, [](Controller &c, S2CMessage const &msg) { c.getConfig().setExposed(msg.configSetExposed); });
  onReceive(S2COpcode::CONFIG_FULL_READ_BEGIN, [](Controller &c, S2CMessage const &) { c.getConfig().doFullConfigRead(c.getClient()); });
  onReceive(S2COpcode::NFC_GET_VERSION,
            [](sim::Controller &c, S2CMessage const &) { c.getClient().sendNfcSetVersion(I2CAddress{1, 0x28}, 0x88); });
}

bool sim::Controller::expectReceive(S2COpcode opcode, std::function<void()> const &scope, S2CMessage *msg,
                                    std::chrono::milliseconds timeout) {
  auto messageReceived = std::make_shared<std::atomic<bool>>(false);
  std::unique_lock<std::mutex> lock(m_notifyLock);

  onReceiveOnce(opcode, [messageReceived, msg](Controller &c, S2CMessage const &m) {
    std::unique_lock<std::mutex> l(c.m_notifyLock);
    messageReceived->store(true);
    if (msg) *msg = m;
    c.m_notifyVar.notify_all();
  });

  scope();

  bool const success = m_notifyVar.wait_for(lock, timeout, [messageReceived] { return messageReceived->load(); });
  m_handlersOnce.erase(opcode);
  return success;
}

void sim::Controller::pressButton(uint8_t id, std::chrono::milliseconds duration) {
  m_client->sendSetButton(id, true);
  std::this_thread::sleep_for(duration);
  m_client->sendSetButton(id, false);
}
