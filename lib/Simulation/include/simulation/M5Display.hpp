#ifndef SIMULATION_M5_DISPLAY_HPP
#define SIMULATION_M5_DISPLAY_HPP

#include "simulation/Print.hpp"

#define TFT_BLACK 0x0000
#define TFT_NAVY 0x000F
#define TFT_DARKGREEN 0x03E0
#define TFT_DARKCYAN 0x03EF
#define TFT_MAROON 0x7800
#define TFT_PURPLE 0x780F
#define TFT_OLIVE 0x7BE0
#define TFT_LIGHTGREY 0xC618
#define TFT_DARKGREY 0x7BEF
#define TFT_BLUE 0x001F
#define TFT_GREEN 0x07E0
#define TFT_CYAN 0x07FF
#define TFT_RED 0xF800
#define TFT_MAGENTA 0xF81F
#define TFT_YELLOW 0xFFE0
#define TFT_WHITE 0xFFFF
#define TFT_ORANGE 0xFDA0
#define TFT_GREENYELLOW 0xB7E0
#define TFT_PINK 0xFC9F

class M5Display : public Print {
 public:
  void clearDisplay();
  void setCursor(int16_t x, int16_t y);
  void setTextSize(uint8_t size);
  void setTextColor(uint16_t color);

  size_t write(uint8_t) override;
  size_t write(const uint8_t *buffer, size_t size) override;
};

#endif  // !defined(SIMULATION_M5_DISPLAY_HPP)
