#include "sim/ControllerThread.hpp"

#include "sim/Client.hpp"
#include "sim/Controller.hpp"

sim::ControllerThread::ControllerThread(std::shared_ptr<Client> const &client) {
  m_stopToken = std::make_shared<std::atomic<bool>>(false);
  m_client = client;
  m_controller = std::make_shared<Controller>(client, m_stopToken);
  m_thread = std::thread([this] { m_controller->run(); });
}

sim::ControllerThread::~ControllerThread() { terminateAndJoin(); }

std::shared_ptr<sim::Client> const &sim::ControllerThread::getClient() const { return m_client; }

std::shared_ptr<sim::Controller> const &sim::ControllerThread::getController() const { return m_controller; }

void sim::ControllerThread::terminateAndJoin() {
  if (m_stopToken && m_client) {
    m_stopToken->store(true);
    m_thread.join();
    m_stopToken.reset();
    m_client.reset();
  }
}
