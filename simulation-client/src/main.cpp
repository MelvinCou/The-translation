#include <raylib.h>

#include <HttpProxy.hpp>
#include <SimulationClient.hpp>
#include <atomic>
#include <memory>
#include <string>
#include <thread>

#include "imgui.h"
#include "rlImGui.h"

#define M5_BG \
  CLITERAL(Color) { 34, 34, 34, 255 }
#define M5_FRAME \
  CLITERAL(Color) { 90, 90, 90, 255 }
#define M5_BUTTON \
  CLITERAL(Color) { 194, 191, 203, 255 }

constexpr int INITIAL_SCREEN_WIDTH = 900;
constexpr int INITIAL_SCREEN_HEIGHT = 900;
constexpr float M5_BASE_SCREEN_WIDTH = 320;
constexpr float M5_BASE_SCREEN_HEIGHT = 240;

struct Dimensions {
  float scale;
  float screenWidth;
  float screenHeight;
  Rectangle m5Screen;
  Rectangle m5Frame;
  Rectangle m5Bezel;
  Rectangle btnBRect;
  Rectangle btnARect;
  Rectangle btnCRect;
  Rectangle btnRRect;

  explicit constexpr Dimensions(float sw, float sh)
      : scale(sw / static_cast<float>(INITIAL_SCREEN_WIDTH)),
        screenWidth(sw),
        screenHeight(sh),
        m5Screen{(screenWidth - M5_BASE_SCREEN_WIDTH * scale) / 2.f, (screenHeight - M5_BASE_SCREEN_HEIGHT * scale) / 2.f,
                 M5_BASE_SCREEN_WIDTH * scale, M5_BASE_SCREEN_HEIGHT * scale},
        m5Frame{(screenWidth - M5_BASE_SCREEN_WIDTH * scale - 50 * scale) / 2.f,
                (screenHeight - M5_BASE_SCREEN_WIDTH * scale - 50 * scale) / 2.f, m5Screen.width + 50 * scale, m5Screen.width + 50 * scale},
        m5Bezel{m5Frame.x + (m5Frame.width - m5Screen.width - 40 * scale) / 2,
                m5Frame.y + (m5Frame.height - m5Screen.width - 40 * scale) / 2, m5Screen.width + 40 * scale, m5Screen.width + 40 * scale},
        btnBRect{m5Frame.x + (m5Frame.width - 40.f * scale) / 2, m5Frame.y + m5Frame.height - 52 * scale, 40 * scale, 40 * scale},
        btnARect{btnBRect.x - 60 * scale, btnBRect.y, btnBRect.width, btnBRect.height},
        btnCRect{btnBRect.x + 60 * scale, btnBRect.y, btnBRect.width, btnBRect.height},
        btnRRect{m5Frame.x - 60 * scale, m5Frame.y, btnBRect.width, btnBRect.height} {}
};

struct Status {
  bool btnADown;
  bool btnBDown;
  bool btnCDown;
  bool btnRDown;
  int cursorX;
  int cursorY;
  float fontSize;
  uint32_t conveyorSpeed;
  HttpProxy httpProxy;

  explicit Status(Dimensions const &d)
      : btnADown(false),
        btnBDown(false),
        btnCDown(false),
        btnRDown(false),
        cursorX(0),
        cursorY(0),
        fontSize(2.f * d.scale),
        conveyorSpeed(0),
        httpProxy{} {}
};

static void resetStatus(Dimensions const &d, Status &status, Image *screen) {
  status = Status(d);
  ImageClearBackground(screen, M5_BG);
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

static void handleEvents(SimulationClient &client, Dimensions const &d, Status &status, Image *screen) {
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
          resetStatus(d, status, screen);
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
          status.conveyorSpeed = msg.conveyorSetSpeed;
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

static void drawGui(SimulationClient &client, Status &status) {
  ImGui::ShowDemoWindow(nullptr);
  ImGui::SetNextWindowCollapsed(false, ImGuiCond_Once);
  if (!ImGui::Begin("TheTranslation Control Panel", nullptr, 0)) {
    // Early out if the window is collapsed, as an optimization.
    ImGui::End();
    return;
  }

  if (ImGui::CollapsingHeader("Simulation Status", ImGuiTreeNodeFlags_DefaultOpen)) {
    bool isConnecting = client.getState() == SimulationClient::State::CONNECTING;
    if (isConnecting) {
      ImGui::TextColored({1.f, 0.f, 0.f, 1.f}, "Connecting...");
    } else {
      ImGui::TextColored({0.f, 1.f, 0.f, 1.f}, "Connected!");
    }
  }

  if (ImGui::CollapsingHeader("M5Stack")) {
    if (ImGui::Button("Reset")) {
      client.sendReset();
    }
    if (ImGui::Button("Button A")) {
      client.sendSetButton(0, false);
    } else if (ImGui::IsItemClicked()) {
      client.sendSetButton(0, true);
    }
    ImGui::SameLine();
    if (ImGui::Button("Button B")) {
      client.sendSetButton(1, false);
    } else if (ImGui::IsItemClicked()) {
      client.sendSetButton(1, true);
    }
    ImGui::SameLine();
    if (ImGui::Button("Button C")) {
      client.sendSetButton(2, false);
    } else if (ImGui::IsItemClicked()) {
      client.sendSetButton(2, true);
    }
  }

  fflush(stdout);
  ImGui::End();
}

int main() {
  SetTraceLogLevel(LOG_NONE);
  InitWindow(INITIAL_SCREEN_WIDTH, INITIAL_SCREEN_HEIGHT, "TheTranslation™ Simulator");
  SetWindowState(FLAG_WINDOW_RESIZABLE);

  SetTargetFPS(60);  // Set our game to run at 60 frames-per-second
  rlImGuiSetup(true);

  Dimensions d(GetScreenWidth(), GetScreenHeight());
  Status status(d);
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
    handleEvents(*client, d, newStatus, &screen);
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

    // Connection status
    bool isConnecting = client->getState() == SimulationClient::State::CONNECTING;
    char const *stateStr = isConnecting ? "Connecting..." : "Connected";
    DrawText(stateStr, d.screenWidth - MeasureText(stateStr, 20) - 10, 10, 20, DARKGREEN);
    DrawCircle(d.m5Frame.x + 20.f * d.scale, d.m5Frame.y + 20.f * d.scale, 7.f * d.scale, isConnecting ? RED : GREEN);

    // Conveyor speed
    std::string conveyorSpeed = "Conveyor speed: " + std::to_string(status.conveyorSpeed);
    DrawText(conveyorSpeed.c_str(), d.screenWidth - MeasureText(conveyorSpeed.c_str(), 20) - 10, d.screenHeight - 30, 20, DARKGREEN);

    drawButtons(d, status);

    rlImGuiBegin();
    drawGui(*client, status);
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
