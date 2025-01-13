#ifndef SIM_HARDWARE_STATE
#define SIM_HARDWARE_STATE

#include "HttpProxy.hpp"
#include "sim/WiFiEnums.hpp"

namespace sim {
/// @brief Raw state of the emulated hardware, access fields with care.
struct HardwareState {
  bool btnADown;
  bool btnBDown;
  bool btnCDown;
  bool btnRDown;
  int cursorX;
  int cursorY;
  float fontSize;
  uint32_t conveyorSpeed;
  HttpProxy httpProxy;
  bool tagReaderEnabled;
  uint8_t tagReaderVersion;
  uint64_t tagReaderUid;
  bool conveyorEnabled;
  bool sorterEnabled;
  uint8_t sorterAngle;
  bool wifiEnabled;
  wifi_mode_t wifiMode;
  wl_status_t wifiStatus;
  char wifiSsid[32];
  char wifiPass[32];
  float eolSensorDistance;
  bool eolSensorEnabled;

  explicit HardwareState(float scale)
      : btnADown(false),
        btnBDown(false),
        btnCDown(false),
        btnRDown(false),
        cursorX(0),
        cursorY(0),
        fontSize(2.f * scale),
        conveyorSpeed(0),
        tagReaderEnabled(true),
        tagReaderVersion(0x88),
        tagReaderUid(0),
        conveyorEnabled(true),
        sorterEnabled(true),
        sorterAngle(0),
        wifiEnabled(true),
        wifiMode(WIFI_MODE_NULL),
        wifiStatus(WL_IDLE_STATUS),
        wifiSsid("Fake WiFi"),
        wifiPass("azerty"),
        eolSensorDistance(9999.f),
        eolSensorEnabled(true) {}

  void partialReset(float scale) {
    btnADown = false;
    btnBDown = false;
    btnCDown = false;
    btnRDown = false;
    cursorX = 0;
    cursorY = 0;
    fontSize = 2.f * scale;
    conveyorSpeed = 0;
    sorterAngle = 0;
    wifiMode = WIFI_MODE_NULL;
    wifiStatus = WL_IDLE_STATUS;
  }
};
}  // namespace sim

#endif  // !defined(SIM_HARDWARE_STATE)
