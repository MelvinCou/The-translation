#include <raylib.h>

#include <SimulationClient.hpp>
#include <atomic>
#include <memory>
#include <string>
#include <thread>

struct Status {
  bool btnADown = false;
  bool btnBDown = false;
  bool btnCDown = false;
  bool btnRDown = false;
  int cursorX = 0;
  int cursorY = 0;
  int fontSize = 2;
  uint32_t conveyorSpeed = 0;
};

#define M5_BG \
  CLITERAL(Color) { 34, 34, 34, 255 }
#define M5_FRAME \
  CLITERAL(Color) { 90, 90, 90, 255 }
#define M5_BUTTON \
  CLITERAL(Color) { 194, 191, 203, 255 }

constexpr int screenWidth = 900;
constexpr int screenHeight = 450;
constexpr int frameX = (screenWidth - 370) / 2;
constexpr int frameY = (screenHeight - 370) / 2;
constexpr Rectangle btnARect{screenWidth / 2.f - 80, static_cast<float>(screenHeight) - 92, 40, 40};
constexpr Rectangle btnBRect{screenWidth / 2.f - 20, static_cast<float>(screenHeight) - 92, 40, 40};
constexpr Rectangle btnCRect{screenWidth / 2.f + 40, static_cast<float>(screenHeight) - 92, 40, 40};
constexpr Rectangle btnRRect{frameX - 60, frameY, 40, 40};

static void resetStatus(Status &status, Image *screen) {
  status = Status{};
  ImageClearBackground(screen, M5_BG);
  printf("Reset state!\n");
}

static void writeToLcd(Status &status, Image *screen, char const *buf, size_t len) {
  std::string text(buf, len);

  for (size_t i = 0; i < len; ++i) {
    char txtBuf[2] = {buf[i], '\0'};

    ImageDrawText(screen, txtBuf, status.cursorX, status.cursorY, status.fontSize * 10, WHITE);
    if (buf[i] == '\n') {
      status.cursorX = 0;
      status.cursorY += status.fontSize * 10;
    } else {
      status.cursorX += MeasureText(txtBuf, status.fontSize * 10) + status.fontSize;
    }
  }
}

static void handleEvents(SimulationClient &client, Status &status, Image *screen) {
  if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) {
    Vector2 mousePos = GetMousePosition();
    status.btnADown = CheckCollisionPointRec(mousePos, btnARect);
    status.btnBDown = CheckCollisionPointRec(mousePos, btnBRect);
    status.btnCDown = CheckCollisionPointRec(mousePos, btnCRect);
    status.btnRDown = CheckCollisionPointRec(mousePos, btnRRect);
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
          resetStatus(status, screen);
          break;
        case S2COpcode::LCD_CLEAR:
          ImageClearBackground(screen, M5_BG);
          break;
        case S2COpcode::LCD_SET_CURSOR:
          status.cursorX = msg.lcdSetCursor.x;
          status.cursorY = msg.lcdSetCursor.y;
          break;
        case S2COpcode::LCD_SET_TEXT_SIZE:
          status.fontSize = msg.lcdSetTextSize.size;
          break;
        case S2COpcode::LCD_WRITE:
          writeToLcd(status, screen, reinterpret_cast<char const *>(msg.lcdWrite.buf), msg.lcdWrite.len);
          break;
        case S2COpcode::CONVEYOR_SET_SPEED:
          status.conveyorSpeed = msg.conveyorSetSpeed;
          break;
        case S2COpcode::MAX_OPCODE:
          break;
      }
    }
  }
}

static void handleChange(SimulationClient &client, Status const &next, Status const &prev) {
  if (next.btnADown != prev.btnADown) {
    C2SMessage setBtnAMsg{C2SOpcode::SET_BUTTON, {}};
    setBtnAMsg.setButton.id = 0;
    setBtnAMsg.setButton.value = next.btnADown ? 1 : 0;
    client.pushToServer(std::move(setBtnAMsg));
  }
  if (next.btnBDown != prev.btnBDown) {
    C2SMessage setBtnBMsg{C2SOpcode::SET_BUTTON, {}};
    setBtnBMsg.setButton.id = 1;
    setBtnBMsg.setButton.value = next.btnBDown ? 1 : 0;
    client.pushToServer(std::move(setBtnBMsg));
  }
  if (next.btnCDown != prev.btnCDown) {
    C2SMessage setBtnCMsg{C2SOpcode::SET_BUTTON, {}};
    setBtnCMsg.setButton.id = 2;
    setBtnCMsg.setButton.value = next.btnCDown ? 1 : 0;
    client.pushToServer(std::move(setBtnCMsg));
  }
  if (next.btnRDown != prev.btnRDown) {
    client.pushToServer(C2SMessage{C2SOpcode::RESET, {}});
  }
  fflush(stdout);
}

static void drawButtons(Status const &status) {
  if (status.btnADown) {
    DrawRectangleRec(btnARect, RED);
  }
  if (status.btnBDown) {
    DrawRectangleRec(btnBRect, RED);
  }
  if (status.btnCDown) {
    DrawRectangleRec(btnCRect, RED);
  }
  if (status.btnRDown) {
    DrawRectangleRec(btnRRect, RED);
  }

  DrawRectangleLinesEx(btnARect, 4, M5_BUTTON);
  DrawRectangleLinesEx(btnBRect, 4, M5_BUTTON);
  DrawRectangleLinesEx(btnCRect, 4, M5_BUTTON);
  DrawRectangleLinesEx(btnRRect, 4, RED);

  DrawText("A", screenWidth / 2 + 13 - 80, screenHeight - 82, 20, M5_BUTTON);
  DrawText("B", screenWidth / 2 + 13 - 20, screenHeight - 82, 20, M5_BUTTON);
  DrawText("C", screenWidth / 2 + 13 + 40, screenHeight - 82, 20, M5_BUTTON);
  DrawText("R", btnRRect.x + 13, btnRRect.y + 10, 20, status.btnRDown ? WHITE : RED);
}

static void runClient(std::shared_ptr<SimulationClient> const &client) { client->run(); }

int main() {
  SetTraceLogLevel(LOG_NONE);
  InitWindow(screenWidth, screenHeight, "TheTranslation™ Simulator");

  SetTargetFPS(60);  // Set our game to run at 60 frames-per-second

  Status status;
  Image screen = GenImageColor(320, 240, M5_BG);

  auto stopToken = std::make_shared<std::atomic<bool>>(false);
  auto client = std::make_shared<SimulationClient>(stopToken);
  auto clientThread = std::thread(runClient, client);

  while (!WindowShouldClose()) {
    Status newStatus = status;
    handleEvents(*client, newStatus, &screen);
    handleChange(*client, newStatus, status);
    status = newStatus;

    Texture2D screenTexture = LoadTextureFromImage(screen);

    BeginDrawing();
    ClearBackground(RAYWHITE);

    std::string fps = "FPS: " + std::to_string(GetFPS());
    DrawText(fps.c_str(), 10, 10, 20, DARKGREEN);

    // M5 Frame
    DrawRectangle(frameX, frameY, 370, 370, M5_FRAME);

    // M5 Bezel
    DrawRectangle((screenWidth - 360) / 2, (screenHeight - 360) / 2, 360, 360, BLACK);

    // M5 Screen
    DrawTexture(screenTexture, (screenWidth - 320) / 2, (screenHeight - 240) / 2, WHITE);

    // Connection status
    bool isConnecting = client->getState() == SimulationClient::State::CONNECTING;
    char const *stateStr = isConnecting ? "Connecting..." : "Connected";
    DrawText(stateStr, screenWidth - MeasureText(stateStr, 20) - 10, 10, 20, DARKGREEN);
    DrawCircle(frameX + 20, frameY + 20, 7, isConnecting ? RED : GREEN);

    // Conveyor speed
    std::string conveyorSpeed = "Conveyor speed: " + std::to_string(status.conveyorSpeed);
    DrawText(conveyorSpeed.c_str(), screenWidth - MeasureText(conveyorSpeed.c_str(), 20) - 10, screenHeight - 30, 20, DARKGREEN);

    drawButtons(status);
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
