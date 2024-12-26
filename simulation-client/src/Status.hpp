#ifndef STATUS_HPP
#define STATUS_HPP

#include <raylib.h>

#include "HttpProxy.hpp"

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
        conveyorSpeed(0) {}
};

#endif  // !defined(STATUS_HPP)
