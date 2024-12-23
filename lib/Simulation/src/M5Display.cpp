#include "simulation/M5Display.hpp"

#include <cstring>
#include <simulation/SimulationServer.hpp>

void M5Display::clearDisplay() {
  S2CMessage clearDisplayMsg{S2COpcode::LCD_CLEAR, {}};
  SimServer.pushToClient(std::move(clearDisplayMsg));
}

void M5Display::setCursor(int16_t x, int16_t y) {
  S2CMessage setCursorMsg{S2COpcode::LCD_SET_CURSOR, {}};
  setCursorMsg.lcdSetCursor.x = x;
  setCursorMsg.lcdSetCursor.y = y;
  SimServer.pushToClient(std::move(setCursorMsg));
}

void M5Display::setTextSize(uint8_t size) {
  S2CMessage setTextSizeMsg{S2COpcode::LCD_SET_TEXT_SIZE, {}};
  setTextSizeMsg.lcdSetTextSize.size = size;
  SimServer.pushToClient(std::move(setTextSizeMsg));
}

size_t M5Display::write(uint8_t b) {
  S2CMessage writeMsg{S2COpcode::LCD_WRITE, {}};
  writeMsg.lcdWrite.len = 1;
  writeMsg.lcdWrite.buf[0] = b;
  SimServer.pushToClient(std::move(writeMsg));
  return 1;
}

size_t M5Display::write(const uint8_t *buffer, size_t size) {
  while (size > 0) {
    size_t chunkSize = size > 255 ? 255 : size;
    S2CMessage writeMsg{S2COpcode::LCD_WRITE, {}};
    writeMsg.lcdWrite.len = static_cast<uint8_t>(chunkSize);
    memcpy(writeMsg.lcdWrite.buf, buffer, chunkSize);
    SimServer.pushToClient(std::move(writeMsg));
    size -= chunkSize;
    buffer += chunkSize;
  }
  return size;
}
