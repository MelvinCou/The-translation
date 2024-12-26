#include "simulation/WebServer.hpp"

#include <SimulationServer.hpp>
#include <WebConfig.hpp>

WebServer::~WebServer() {}

void WebServer::begin([[maybe_unused]] uint16_t port) { SimServer.sendConfigSetExposed(true); }

void WebServer::handleClient() {
  if (m_conf == nullptr) return;
  m_conf->popValueChange(false);
}

void WebServer::close() {
  SimServer.sendConfigSetExposed(false);
  m_conf = nullptr;
}

void WebServer::on([[maybe_unused]] const Uri& uri, THandlerFunction fn) { fn(); }
