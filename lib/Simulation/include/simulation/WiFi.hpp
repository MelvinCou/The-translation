#ifndef SIMULATION_WIFI_HPP
#define SIMULATION_WIFI_HPP

#include <freertos/FreeRTOS.h>
#include <freertos/semphr.h>

#include <atomic>

#include "simulation/Arduino.hpp"

class IPAddress {
 public:
  String toString() const;

 private:
  explicit IPAddress(char const* ip);

  String m_ip;

  friend class WiFiClass;
};

typedef enum {
  WIFI_MODE_NULL = 0,
  WIFI_MODE_STA,
  WIFI_MODE_AP,
  WIFI_MODE_APSTA,
  WIFI_MODE_MAX,
} wifi_mode_t;

typedef enum {
  WL_NO_SHIELD = 255,
  WL_IDLE_STATUS = 0,
  WL_NO_SSID_AVAIL = 1,
  WL_SCAN_COMPLETED = 2,
  WL_CONNECTED = 3,
  WL_CONNECT_FAILED = 4,
  WL_CONNECTION_LOST = 5,
  WL_DISCONNECTED = 6
} wl_status_t;

#define WiFiMode_t wifi_mode_t
#define WIFI_OFF WIFI_MODE_NULL
#define WIFI_STA WIFI_MODE_STA
#define WIFI_AP WIFI_MODE_AP
#define WIFI_AP_STA WIFI_MODE_APSTA

class WiFiClass {
 public:
  WiFiClass();
  ~WiFiClass();

  IPAddress softAPIP();

  bool softAP(const char* ssid, const char* passphrase = nullptr, int channel = 1, int ssid_hidden = 0, int max_connection = 4,
              bool ftm_responder = false);
  wl_status_t begin(const char* ssid, const char* passphrase = nullptr, int32_t channel = 0, const uint8_t* bssid = nullptr,
                    bool connect = true);

  static bool mode(wifi_mode_t);
  static wifi_mode_t getMode();
  static wl_status_t status();

 private:
  std::atomic<WiFiMode_t> m_mode;
  std::atomic<wl_status_t> m_status;
  std::atomic<bool> m_handlersRegistered;
  IPAddress m_ip;
  SemaphoreHandle_t m_setModeAckNotification;
  SemaphoreHandle_t m_connectNotification;

  bool setMode(wifi_mode_t mode);
  void registerHandlers();
};

extern WiFiClass WiFi;

#endif  // !defined(SIMULATION_WIFI_HPP)
