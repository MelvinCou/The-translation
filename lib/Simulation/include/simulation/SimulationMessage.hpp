#ifndef SIMULATION_MESSAGE_HPP
#define SIMULATION_MESSAGE_HPP

#include <cstddef>

enum class C2SOpcode : uint8_t {
  PING = 0,
  RESET,
  SET_BUTTON,
  MAX_OPCODE,
};

struct __attribute__((packed)) C2SMessage {
  C2SOpcode opcode;
  union {
    struct {
      uint8_t id;
      uint8_t value;
    } setButton;
  };

  [[nodiscard]] size_t getLength() const {
    switch (opcode) {
      case C2SOpcode::PING:
      case C2SOpcode::RESET:
        return 1;
      case C2SOpcode::SET_BUTTON:
        return 1 + sizeof(setButton);
      case C2SOpcode::MAX_OPCODE:
        return 0;
    }
    return 0;
  }
};

enum class S2COpcode : uint8_t {
  PONG = 0,
  RESET,
  LCD_CLEAR,
  LCD_SET_CURSOR,
  LCD_SET_TEXT_SIZE,
  LCD_WRITE,
  CONVEYOR_SET_SPEED,
  MAX_OPCODE,
};

struct __attribute__((packed)) S2CMessage {
  S2COpcode opcode;
  union {
    struct {
      int16_t x;
      int16_t y;
    } lcdSetCursor;
    struct {
      uint8_t size;
    } lcdSetTextSize;
    struct {
      uint8_t len;
      uint8_t buf[256];
    } lcdWrite;
    uint32_t conveyorSetSpeed;
  };

  [[nodiscard]] size_t getLength() const {
    switch (opcode) {
      case S2COpcode::PONG:
      case S2COpcode::RESET:
      case S2COpcode::LCD_CLEAR:
        return 1;
      case S2COpcode::LCD_SET_CURSOR:
        return 1 + sizeof(lcdSetCursor);
      case S2COpcode::LCD_SET_TEXT_SIZE:
        return 1 + sizeof(lcdSetTextSize);
      case S2COpcode::LCD_WRITE:
        return 1 + sizeof(lcdWrite);
      case S2COpcode::CONVEYOR_SET_SPEED:
        return 1 + sizeof(conveyorSetSpeed);
      case S2COpcode::MAX_OPCODE:
        return 0;
    }
    return 0;
  }
};

#endif  // !defined(SIMULATION_MESSAGE_HPP)
