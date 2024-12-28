#include "simulation/WebServer.hpp"

#include <esp_log.h>

#include <SimulationServer.hpp>
#include <WebConfig.hpp>

WebServer::~WebServer() {}

void WebServer::begin([[maybe_unused]] uint16_t port) {
  if (WiFiClass::getMode() != WIFI_MODE_AP) {
    ESP_LOGE("WebServer", "WiFi not in AP mode, cannot start web server, current: %d", static_cast<int>(WiFiClass::getMode()));
  } else if (WiFiClass::status() != WL_CONNECTED) {
    ESP_LOGE("WebServer", "WiFi not connected, cannot start web server, current: %d", static_cast<int>(WiFiClass::status()));
  } else {
    SimServer.sendConfigSetExposed(true);
  }
}

void WebServer::handleClient() {
  if (m_conf == nullptr) return;
  m_conf->popValueChange(false);
}

void WebServer::close() {
  SimServer.sendConfigSetExposed(false);
  m_conf = nullptr;
}

void WebServer::on([[maybe_unused]] const Uri& uri, THandlerFunction fn) { fn(); }
