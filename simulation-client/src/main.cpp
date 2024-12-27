#include <raylib.h>

#include <atomic>
#include <memory>
#include <string>
#include <thread>

#include "Configuration.hpp"
#include "HttpProxy.hpp"
#include "SimulationClient.hpp"
#include "Status.hpp"
#include "imgui.h"
#include "rlImGui.h"

static void resetStatus(Dimensions const &d, Status &status, Image *screen, Configuration &config) {
  status.partialReset(d);
  ImageClearBackground(screen, M5_BG);
  config.loadFromFile(CONFIG_DEFAULT_PATH);
  printf("Reset state!\n");
}

static void writeToLcd(Dimensions const &d, Status &status, Image *screen, char const *buf, size_t len) {
  std::string text(buf, len);

  for (size_t i = 0; i < len; ++i) {
    char txtBuf[2] = {buf[i], '\0'};

    if (buf[i] == '\n') {
      status.cursorX = 0;
      status.cursorY += status.fontSize * 10;
    } else {
      int textWidth = MeasureText(txtBuf, status.fontSize * 10) + status.fontSize;
      if (status.cursorX + textWidth > d.m5Screen.width) {
        status.cursorX = 0;
        status.cursorY += status.fontSize * 10;
      } else {
        ImageDrawText(screen, txtBuf, status.cursorX, status.cursorY, status.fontSize * 10, WHITE);
        status.cursorX += textWidth;
      }
    }
  }
}

static void handleEvents(SimulationClient &client, Dimensions const &d, Status &status, Configuration &config, Image *screen) {
  if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) {
    Vector2 mousePos = GetMousePosition();
    status.btnADown = CheckCollisionPointRec(mousePos, d.btnARect);
    status.btnBDown = CheckCollisionPointRec(mousePos, d.btnBRect);
    status.btnCDown = CheckCollisionPointRec(mousePos, d.btnCRect);
    status.btnRDown = CheckCollisionPointRec(mousePos, d.btnRRect);
  } else {
    status.btnADown = false;
    status.btnBDown = false;
    status.btnCDown = false;
    status.btnRDown = false;
  }

  std::vector<S2CMessage> messages;
  if (client.popFromServer(messages)) {
    for (auto const &msg : messages) {
      switch (msg.opcode) {
        case S2COpcode::PONG:
          break;
        case S2COpcode::RESET:
          resetStatus(d, status, screen, config);
          break;
        case S2COpcode::LCD_CLEAR:
          ImageClearBackground(screen, M5_BG);
          break;
        case S2COpcode::LCD_SET_CURSOR:
          status.cursorX = msg.lcdSetCursor.x;
          status.cursorY = msg.lcdSetCursor.y;
          break;
        case S2COpcode::LCD_SET_TEXT_SIZE:
          status.fontSize = msg.lcdSetTextSize.size * d.scale;
          break;
        case S2COpcode::LCD_WRITE:
          writeToLcd(d, status, screen, reinterpret_cast<char const *>(msg.lcdWrite.buf), msg.lcdWrite.len);
          break;
        case S2COpcode::CONVEYOR_SET_SPEED:
          if (status.conveyorEnabled) status.conveyorSpeed = msg.conveyorSetSpeed;
          break;
        case S2COpcode::HTTP_BEGIN:
          status.httpProxy.begin(msg.httpBegin.reqId, reinterpret_cast<char const *>(msg.httpBegin.host), msg.httpBegin.len,
                                 msg.httpBegin.port);
          break;
        case S2COpcode::HTTP_WRITE:
          status.httpProxy.append(msg.httpWrite.reqId, reinterpret_cast<char const *>(msg.httpWrite.buf), msg.httpWrite.len);
          break;
        case S2COpcode::HTTP_END:
          status.httpProxy.end(msg.httpEnd.reqId, client);
          break;
        case S2COpcode::CONFIG_SCHEMA_RESET:
          config.resetSchema();
          break;
        case S2COpcode::CONFIG_SCHEMA_DEFINE:
          config.define(msg);
          break;
        case S2COpcode::CONFIG_SCHEMA_END_DEFINE:
          config.loadFromFile(CONFIG_DEFAULT_PATH);
          config.saveToFile(CONFIG_DEFAULT_PATH);
          break;
        case S2COpcode::CONFIG_SET_EXPOSED:
          config.setExposed(msg.configSetExposed);
          break;
        case S2COpcode::CONFIG_FULL_READ_BEGIN:
          config.doFullConfigRead(client);
          break;
        case S2COpcode::NFC_GET_VERSION:
          if (status.tagReaderEnabled) client.sendNfcSetVersion(I2CAddress{0, 0x28}, status.tagReaderVersion);
          break;
        case S2COpcode::SORTER_SET_ANGLE:
          if (status.sorterEnabled) status.sorterAngle = msg.sorterSetAngle;
          break;
        case S2COpcode::MAX_OPCODE:
          break;
      }
    }
  }
}

static void handleChange(SimulationClient &client, Status const &next, Status const &prev) {
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

static void drawButtons(Dimensions const &d, Status const &status) {
  if (status.btnADown) {
    DrawRectangleRec(d.btnARect, RED);
  }
  if (status.btnBDown) {
    DrawRectangleRec(d.btnBRect, RED);
  }
  if (status.btnCDown) {
    DrawRectangleRec(d.btnCRect, RED);
  }
  if (status.btnRDown) {
    DrawRectangleRec(d.btnRRect, RED);
  }

  DrawRectangleLinesEx(d.btnARect, 4, M5_BUTTON);
  DrawRectangleLinesEx(d.btnBRect, 4, M5_BUTTON);
  DrawRectangleLinesEx(d.btnCRect, 4, M5_BUTTON);
  DrawRectangleLinesEx(d.btnRRect, 4, RED);

  DrawText("A", d.btnARect.x + 13 * d.scale, d.btnARect.y + 10 * d.scale, 20 * d.scale, M5_BUTTON);
  DrawText("B", d.btnBRect.x + 13 * d.scale, d.btnBRect.y + 10 * d.scale, 20 * d.scale, M5_BUTTON);
  DrawText("C", d.btnCRect.x + 13 * d.scale, d.btnCRect.y + 10 * d.scale, 20 * d.scale, M5_BUTTON);
  DrawText("R", d.btnRRect.x + 13 * d.scale, d.btnRRect.y + 10 * d.scale, 20 * d.scale, status.btnRDown ? WHITE : RED);
}

static void runClient(std::shared_ptr<SimulationClient> const &client) { client->run(); }

void drawGui(SimulationClient &client, Status &status, Configuration &config);

int main() {
  SetTraceLogLevel(LOG_NONE);
  InitWindow(INITIAL_SCREEN_WIDTH, INITIAL_SCREEN_HEIGHT, "TheTranslation™ Simulator");
  SetWindowState(FLAG_WINDOW_RESIZABLE);

  SetTargetFPS(60);  // Set our game to run at 60 frames-per-second
  rlImGuiSetup(true);

  Dimensions d(GetScreenWidth(), GetScreenHeight());
  Status status(d);
  Configuration config;
  Image screen = GenImageColor(d.m5Screen.width, d.m5Screen.height, M5_BG);

  auto stopToken = std::make_shared<std::atomic<bool>>(false);
  auto client = std::make_shared<SimulationClient>(stopToken);
  auto clientThread = std::thread(runClient, client);

  while (!WindowShouldClose()) {
    if (IsWindowResized()) {
      float oldScale = d.scale;
      int sw = GetScreenWidth();
      int sh = GetScreenHeight();
      d = Dimensions(sw, sh);
      ImageResize(&screen, d.m5Screen.width, d.m5Screen.height);
      status.fontSize *= d.scale / oldScale;
    }

    Status newStatus = status;
    handleEvents(*client, d, newStatus, config, &screen);
    handleChange(*client, newStatus, status);
    status = newStatus;

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

    drawButtons(d, status);

    rlImGuiBegin();
    drawGui(*client, status, config);
    rlImGuiEnd();

    EndDrawing();

    UnloadTexture(screenTexture);
  }
  printf("Closing!\n");
  stopToken->store(true);
  clientThread.join();

  UnloadImage(screen);

  CloseWindow();  // Close window and OpenGL context
  return 0;
}
