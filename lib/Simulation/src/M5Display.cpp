#include "simulation/M5Display.hpp"

#include <cstring>
#include <simulation/SimulationServer.hpp>

void M5Display::clearDisplay() { SimServer.sendLcdClear(); }

void M5Display::setCursor(int16_t x, int16_t y) { SimServer.sendLcdSetCursor(x, y); }

void M5Display::setTextSize(uint8_t size) { SimServer.sendLcdSetTextSize(size); }

void M5Display::setTextColor(uint16_t color) { SimServer.sendLcdSetTextColor(color); }

size_t M5Display::write(uint8_t b) {
  SimServer.sendLcdWrite(&b, 1);
  return 1;
}

size_t M5Display::write(const uint8_t *buffer, size_t size) {
  while (size > 0) {
    size_t chunkSize = size > 255 ? 255 : size;
    SimServer.sendLcdWrite(buffer, chunkSize);
    size -= chunkSize;
    buffer += chunkSize;
  }
  return size;
}
