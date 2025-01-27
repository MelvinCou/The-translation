#include <raylib.h>

#include <atomic>
#include <memory>
#include <sim/Controller.hpp>
#include <string>
#include <thread>

#include "Dimensions.hpp"
#include "imgui.h"
#include "rlImGui.h"
#include "sim/Client.hpp"
#include "sim/ClientThread.hpp"
#include "sim/Configuration.hpp"
#include "sim/HardwareState.hpp"
#include "sim/HttpProxy.hpp"

static void resetStatus(Dimensions const &d, sim::HardwareState &hw, Image *screen, sim::Configuration &config) {
  hw.partialReset(d.scale);
  ImageClearBackground(screen, M5_BG);
  config.loadFromFile(CONFIG_DEFAULT_PATH);
  printf("Reset state!\n");
}

static void writeToLcd(Dimensions const &d, sim::HardwareState &hw, Image *screen, char const *buf, size_t len) {
  std::string text(buf, len);

  for (size_t i = 0; i < len; ++i) {
    char txtBuf[2] = {buf[i], '\0'};

    if (buf[i] == '\n') {
      hw.cursorX = 0;
      hw.cursorY += hw.fontSize * 10;
    } else {
      int textWidth = MeasureText(txtBuf, hw.fontSize * 10) + hw.fontSize;
      if (hw.cursorX + textWidth > d.m5Screen.width) {
        hw.cursorX = 0;
        hw.cursorY += hw.fontSize * 10;
      } else {
        Color color{
            static_cast<unsigned char>((hw.textColor >> 24) & 0xFF),
            static_cast<unsigned char>((hw.textColor >> 16) & 0xFF),
            static_cast<unsigned char>((hw.textColor >> 8) & 0xFF),
            static_cast<unsigned char>(hw.textColor & 0xFF),
        };
        ImageDrawText(screen, txtBuf, hw.cursorX, hw.cursorY, hw.fontSize * 10, color);
        hw.cursorX += textWidth;
      }
    }
  }
}

static void onWifiConnect(sim::Client &client, sim::HardwareState &hw, std::string const &ssid, std::string const &pass) {
  if (!hw.wifiEnabled) {
    fprintf(stderr, "Ignoring WiFi connection attempt: WiFi is disabled\n");
  } else if (ssid != hw.wifiSsid) {
    fprintf(stderr, "Blocking WiFi connection attempt: SSID mismatch: expected [%s], got [%s]\n", hw.wifiSsid, ssid.c_str());
    hw.wifiStatus = sim::WL_NO_SSID_AVAIL;
    client.sendWifiConnectResponse(sim::WL_NO_SSID_AVAIL);
  } else if (pass != hw.wifiPass) {
    fprintf(stderr, "Blocking WiFi connection attempt: Password mismatch: expected [%s], got [%s]\n", hw.wifiPass, pass.c_str());
    hw.wifiStatus = sim::WL_NO_SSID_AVAIL;
    client.sendWifiConnectResponse(sim::WL_NO_SSID_AVAIL);
  } else {
    printf("Accepting WiFi connection attempt\n");
    hw.wifiStatus = sim::WL_CONNECTED;
    client.sendWifiConnectResponse(sim::WL_CONNECTED);
  }
}

static void registerHandlers(sim::Controller &ctrl, Dimensions *d, Image *screen) {
  ctrl.registerDefaultReceiveHandlers();
  ctrl.onReceive(S2COpcode::RESET,
                 [d, screen](sim::Controller &c, S2CMessage const &) { resetStatus(*d, c.getHardwareState(), screen, c.getConfig()); });
  ctrl.onReceive(S2COpcode::LCD_CLEAR, [screen](sim::Controller &, S2CMessage const &) { ImageClearBackground(screen, M5_BG); });
  ctrl.onReceive(S2COpcode::LCD_SET_CURSOR, [](sim::Controller &c, S2CMessage const &msg) {
    c.getHardwareState().cursorX = msg.lcdSetCursor.x;
    c.getHardwareState().cursorY = msg.lcdSetCursor.y;
  });
  ctrl.onReceive(S2COpcode::LCD_SET_TEXT_SIZE,
                 [d](sim::Controller &c, S2CMessage const &msg) { c.getHardwareState().fontSize = msg.lcdSetTextSize * d->scale; });
  ctrl.onReceive(S2COpcode::LCD_SET_TEXT_COLOR, [d](sim::Controller &c, S2CMessage const &msg) {
    uint32_t r = ((msg.lcdSetTextColor >> 11) & 0x1F) * 8;
    uint32_t g = ((msg.lcdSetTextColor >> 5) & 0x3F) * 8;
    uint32_t b = (msg.lcdSetTextColor & 0x1F) * 8;
    c.getHardwareState().textColor = (r << 24) | (g << 16) | (b << 8) | 0xFF;
  });
  ctrl.onReceive(S2COpcode::LCD_WRITE, [d, screen](sim::Controller &c, S2CMessage const &msg) {
    writeToLcd(*d, c.getHardwareState(), screen, reinterpret_cast<char const *>(msg.lcdWrite.buf), msg.lcdWrite.len);
  });
  ctrl.onReceive(S2COpcode::CONVEYOR_SET_SPEED, [](sim::Controller &c, S2CMessage const &msg) {
    if (c.getHardwareState().conveyorEnabled) c.getHardwareState().conveyorSpeed = msg.conveyorSetSpeed;
  });
  ctrl.onReceive(S2COpcode::HTTP_BEGIN, [](sim::Controller &c, S2CMessage const &msg) {
    c.getHardwareState().httpProxy.begin(msg.httpBegin.reqId, reinterpret_cast<char const *>(msg.httpBegin.host), msg.httpBegin.len,
                                         msg.httpBegin.port);
  });
  ctrl.onReceive(S2COpcode::HTTP_WRITE, [](sim::Controller &c, S2CMessage const &msg) {
    c.getHardwareState().httpProxy.append(msg.httpWrite.reqId, reinterpret_cast<char const *>(msg.httpWrite.buf), msg.httpWrite.len);
  });
  ctrl.onReceive(S2COpcode::HTTP_END,
                 [](sim::Controller &c, S2CMessage const &msg) { c.getHardwareState().httpProxy.end(msg.httpEnd.reqId, c.getClient()); });
  ctrl.onReceive(S2COpcode::NFC_GET_VERSION, [](sim::Controller &c, S2CMessage const &) {
    if (c.getHardwareState().tagReaderEnabled) c.getClient().sendNfcSetVersion(I2CAddress{1, 0x28}, c.getHardwareState().tagReaderVersion);
  });
  ctrl.onReceive(S2COpcode::WIFI_SET_MODE, [](sim::Controller &c, S2CMessage const &msg) {
    if (c.getHardwareState().wifiEnabled) {
      c.getHardwareState().wifiMode = static_cast<sim::wifi_mode_t>(msg.wifiSetMode);
      c.getClient().sendWifiSetModeAck();
    }
  });
  ctrl.onReceive(S2COpcode::WIFI_CONNECT, [](sim::Controller &c, S2CMessage const &msg) {
    onWifiConnect(c.getClient(), c.getHardwareState(),
                  std::string(reinterpret_cast<char const *>(msg.wifiConnect.buf), msg.wifiConnect.ssidLen),
                  std::string(reinterpret_cast<char const *>(msg.wifiConnect.buf + msg.wifiConnect.ssidLen), msg.wifiConnect.passLen));
  });
}

static void handleEvents(sim::Controller &ctrl, sim::HardwareState &hw, Dimensions const &d) {
  if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) {
    Vector2 mousePos = GetMousePosition();
    hw.btnADown = CheckCollisionPointRec(mousePos, d.btnARect);
    hw.btnBDown = CheckCollisionPointRec(mousePos, d.btnBRect);
    hw.btnCDown = CheckCollisionPointRec(mousePos, d.btnCRect);
    hw.btnRDown = CheckCollisionPointRec(mousePos, d.btnRRect);
  } else {
    hw.btnADown = false;
    hw.btnBDown = false;
    hw.btnCDown = false;
    hw.btnRDown = false;
  }

  ctrl.step();
}

static void handleChange(sim::Client &client, sim::HardwareState const &next, sim::HardwareState const &prev) {
  if (next.btnADown != prev.btnADown) {
    client.sendSetButton(0, next.btnADown);
  }
  if (next.btnBDown != prev.btnBDown) {
    client.sendSetButton(1, next.btnBDown);
  }
  if (next.btnCDown != prev.btnCDown) {
    client.sendSetButton(2, next.btnCDown);
  }
  if (next.btnRDown != prev.btnRDown) {
    client.sendReset();
  }
  fflush(stdout);
}

static void drawButtons(Dimensions const &d, sim::HardwareState const &hw) {
  if (hw.btnADown) {
    DrawRectangleRec(d.btnARect, RED);
  }
  if (hw.btnBDown) {
    DrawRectangleRec(d.btnBRect, RED);
  }
  if (hw.btnCDown) {
    DrawRectangleRec(d.btnCRect, RED);
  }
  if (hw.btnRDown) {
    DrawRectangleRec(d.btnRRect, RED);
  }

  DrawRectangleLinesEx(d.btnARect, 4, M5_BUTTON);
  DrawRectangleLinesEx(d.btnBRect, 4, M5_BUTTON);
  DrawRectangleLinesEx(d.btnCRect, 4, M5_BUTTON);
  DrawRectangleLinesEx(d.btnRRect, 4, RED);

  DrawText("A", d.btnARect.x + 13 * d.scale, d.btnARect.y + 10 * d.scale, 20 * d.scale, M5_BUTTON);
  DrawText("B", d.btnBRect.x + 13 * d.scale, d.btnBRect.y + 10 * d.scale, 20 * d.scale, M5_BUTTON);
  DrawText("C", d.btnCRect.x + 13 * d.scale, d.btnCRect.y + 10 * d.scale, 20 * d.scale, M5_BUTTON);
  DrawText("R", d.btnRRect.x + 13 * d.scale, d.btnRRect.y + 10 * d.scale, 20 * d.scale, hw.btnRDown ? WHITE : RED);
}

void drawGui(sim::Client &client, sim::HardwareState &hw, sim::Configuration &config);

int main() {
  SetTraceLogLevel(LOG_NONE);
  InitWindow(INITIAL_SCREEN_WIDTH, INITIAL_SCREEN_HEIGHT, "TheTranslation™ Simulator");
  SetWindowState(FLAG_WINDOW_RESIZABLE);

  SetTargetFPS(60);  // Set our game to run at 60 frames-per-second
  rlImGuiSetup(true);

  Dimensions d(GetScreenWidth(), GetScreenHeight());
  Image screen = GenImageColor(d.m5Screen.width, d.m5Screen.height, M5_BG);

  sim::ClientThread clientThread;
  std::shared_ptr<sim::Client> client = clientThread.getClient();

  sim::Controller ctrl(client, std::shared_ptr<std::atomic<bool>>(), d.scale);

  registerHandlers(ctrl, &d, &screen);

  while (!WindowShouldClose()) {
    if (IsWindowResized()) {
      float oldScale = d.scale;
      int sw = GetScreenWidth();
      int sh = GetScreenHeight();
      auto newDims = Dimensions(sw, sh);
      std::swap(d, newDims);
      ImageResize(&screen, d.m5Screen.width, d.m5Screen.height);
      ctrl.getHardwareState().fontSize *= d.scale / oldScale;
    }

    sim::HardwareState oldHw = ctrl.getHardwareState();
    handleEvents(ctrl, ctrl.getHardwareState(), d);
    handleChange(*client, oldHw, ctrl.getHardwareState());

    Texture2D screenTexture = LoadTextureFromImage(screen);

    BeginDrawing();
    ClearBackground(RAYWHITE);

    std::string fps = "FPS: " + std::to_string(GetFPS());
    DrawText(fps.c_str(), 10, 10, 20, DARKGREEN);

    // M5 Frame
    DrawRectangleRec(d.m5Frame, M5_FRAME);

    // M5 Bezel
    DrawRectangleRec(d.m5Bezel, BLACK);

    // M5 Screen
    DrawTexture(screenTexture, d.m5Screen.x, d.m5Screen.y, WHITE);

    drawButtons(d, ctrl.getHardwareState());

    rlImGuiBegin();
    drawGui(*client, ctrl.getHardwareState(), ctrl.getConfig());
    rlImGuiEnd();

    EndDrawing();

    UnloadTexture(screenTexture);
  }
  printf("Closing!\n");
  clientThread.terminateAndJoin();

  UnloadImage(screen);

  CloseWindow();  // Close window and OpenGL context
  return 0;
}
