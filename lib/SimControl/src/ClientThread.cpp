#include "sim/ClientThread.hpp"

#include <utility>

#include "sim/Client.hpp"

sim::ClientThread::ClientThread() {
  m_stopToken = std::make_shared<std::atomic<bool>>(false);
  m_client = std::make_shared<sim::Client>(m_stopToken);
  m_thread = std::thread([this] { m_client->run(); });
}

sim::ClientThread::~ClientThread() { terminateAndJoin(); }

sim::Client& sim::ClientThread::getClient() { return *m_client; }

void sim::ClientThread::terminateAndJoin() {
  if (m_stopToken && m_client) {
    m_stopToken->store(true);
    m_thread.join();
    m_stopToken.reset();
    m_client.reset();
  }
}
