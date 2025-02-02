#ifndef SIM_WIFI_ENUMS_HPP
#define SIM_WIFI_ENUMS_HPP

namespace sim {
typedef enum {
  WIFI_MODE_NULL = 0,
  WIFI_MODE_STA,
  WIFI_MODE_AP,
  WIFI_MODE_APSTA,
  WIFI_MODE_MAX,
} wifi_mode_t;

static constexpr char const *WIFI_MODE_NAMES[] = {
    "WIFI_MODE_NULL", "WIFI_MODE_STA", "WIFI_MODE_AP", "WIFI_MODE_APSTA", "WIFI_MODE_MAX", "WIFI_MODE_UNKNOWN",
};

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

static constexpr char const *WL_STATUS_NAMES[] = {
    "WL_IDLE_STATUS",    "WL_NO_SSID_AVAIL",   "WL_SCAN_COMPLETED", "WL_CONNECTED",
    "WL_CONNECT_FAILED", "WL_CONNECTION_LOST", "WL_DISCONNECTED",   "WL_UNKNOWN",
};
}  // namespace sim

#endif  // !defined(SIM_WIFI_ENUMS_HPP)
