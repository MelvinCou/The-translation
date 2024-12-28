#include "simulation/WiFi.hpp"

#include <esp_log.h>

#include <SimulationServer.hpp>

WiFiClass WiFi;

WiFiClass::WiFiClass()
    : m_mode(WIFI_OFF),
      m_status(WL_IDLE_STATUS),
      m_handlersRegistered(false),
      m_ip("127.0.0.1"),
      m_setModeAckNotification(xSemaphoreCreateBinary()),
      m_connectNotification(xSemaphoreCreateBinary()) {}

WiFiClass::~WiFiClass() {
  vSemaphoreDelete(m_setModeAckNotification);
  vSemaphoreDelete(m_connectNotification);
}

IPAddress WiFiClass::softAPIP() { return m_ip; }

bool WiFiClass::softAP(const char* ssid, const char* passphrase, int channel, int ssid_hidden, int max_connection, bool ftm_responder) {
  if (m_mode.load() != WIFI_MODE_AP) {
    ESP_LOGE("WiFi", "Cannot export access point, not in WIFI_MODE_AP");
    m_status.store(WL_CONNECT_FAILED);
    return false;
  }
  m_status.store(WL_CONNECTED);
  return true;
}

wl_status_t WiFiClass::begin(const char* ssid, const char* passphrase, int32_t channel, const uint8_t* bssid, bool connect) {
  if (m_mode.load() != WIFI_MODE_STA) {
    ESP_LOGE("WiFi", "Cannot export access point, not in WIFI_MODE_STA");
    m_status.store(WL_CONNECT_FAILED);
    return WL_CONNECT_FAILED;
  }
  registerHandlers();
  SimServer.sendWifiConnect(ssid, passphrase);
  if (xSemaphoreTake(m_connectNotification, pdMS_TO_TICKS(1000)) == pdTRUE) {
    return m_status.load();
  }
  ESP_LOGE("WiFi", "Cannot connect: timeout");
  m_status.store(WL_CONNECT_FAILED);
  return WL_CONNECT_FAILED;
}

bool WiFiClass::mode(wifi_mode_t mode) { return WiFi.setMode(mode); }

bool WiFiClass::setMode(wifi_mode_t mode) {
  registerHandlers();
  SimServer.sendWifiSetMode(mode);
  if (xSemaphoreTake(m_setModeAckNotification, pdMS_TO_TICKS(1000)) == pdTRUE) {
    m_mode.store(mode);
    return true;
  }
  ESP_LOGE("WiFi", "Failed to set mode %d: timeout", static_cast<int>(mode));
  return false;
}

wifi_mode_t WiFiClass::getMode() { return WiFi.m_mode; }

wl_status_t WiFiClass::status() { return WiFi.m_status; }

void WiFiClass::registerHandlers() {
  bool expected = false;
  if (!m_handlersRegistered.compare_exchange_strong(expected, true)) return;

  SimServer.registerWifiOnSetModeAck([this]() { xSemaphoreGive(m_setModeAckNotification); });
  SimServer.registerWifiOnConnectResponse([this](int status) {
    m_status.store(static_cast<wl_status_t>(status));
    xSemaphoreGive(m_connectNotification);
  });
}

IPAddress::IPAddress(char const* ip) : m_ip(ip) {}

String IPAddress::toString() const { return m_ip; }
