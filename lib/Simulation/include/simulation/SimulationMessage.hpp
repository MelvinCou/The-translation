#ifndef SIMULATION_MESSAGE_HPP
#define SIMULATION_MESSAGE_HPP

#include <cstddef>

enum class C2SOpcode : uint8_t {
  PING = 0,
  RESET,
  SET_BUTTON,
  HTTP_BEGIN,
  HTTP_WRITE,
  HTTP_END,
  MAX_OPCODE,
};

struct __attribute__((packed)) HttpBeginPayload {
  uint32_t reqId;
  uint16_t port;
  uint8_t len;
  uint8_t host[127];
};

struct __attribute__((packed)) HttpWritePayload {
  uint32_t reqId;
  uint8_t len;
  uint8_t buf[255];
};

struct __attribute__((packed)) HttpEndPayload {
  uint32_t reqId;
};

struct __attribute__((packed)) C2SMessage {
  C2SOpcode opcode;
  union {
    struct {
      uint8_t id;
      uint8_t value;
    } setButton;
    HttpBeginPayload httpBegin;
    HttpWritePayload httpWrite;
    HttpEndPayload httpEnd;
  };

  [[nodiscard]] size_t getLength() const {
    switch (opcode) {
      case C2SOpcode::PING:
      case C2SOpcode::RESET:
        return 1;
      case C2SOpcode::SET_BUTTON:
        return 1 + sizeof(setButton);
      case C2SOpcode::HTTP_BEGIN:
        return 1 + sizeof(httpBegin);
      case C2SOpcode::HTTP_WRITE:
        return 1 + sizeof(httpWrite);
      case C2SOpcode::HTTP_END:
        return 1 + sizeof(httpEnd);
      case C2SOpcode::MAX_OPCODE:
        return 0;
    }
    return 0;
  }

  [[nodiscard]] char const *getName() const {
    switch (opcode) {
      case C2SOpcode::PING:
        return "PONG";
      case C2SOpcode::RESET:
        return "RESET";
      case C2SOpcode::SET_BUTTON:
        return "SET_BUTTON";
      case C2SOpcode::HTTP_BEGIN:
        return "HTTP_BEGIN";
      case C2SOpcode::HTTP_WRITE:
        return "HTTP_WRITE";
      case C2SOpcode::HTTP_END:
        return "HTTP_END";
      case C2SOpcode::MAX_OPCODE:
        return "UNKNOWN";
    }
    return "UNKNOWN";
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
  HTTP_BEGIN,
  HTTP_WRITE,
  HTTP_END,
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
      uint8_t buf[255];
    } lcdWrite;
    uint32_t conveyorSetSpeed;
    HttpBeginPayload httpBegin;
    HttpWritePayload httpWrite;
    HttpEndPayload httpEnd;
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
      case S2COpcode::HTTP_BEGIN:
        return 1 + sizeof(httpBegin);
      case S2COpcode::HTTP_WRITE:
        return 1 + sizeof(httpWrite);
      case S2COpcode::HTTP_END:
        return 1 + sizeof(httpEnd);
      case S2COpcode::MAX_OPCODE:
        return 0;
    }
    return 0;
  }

  [[nodiscard]] char const *getName() const {
    switch (opcode) {
      case S2COpcode::PONG:
        return "PONG";
      case S2COpcode::RESET:
        return "RESET";
      case S2COpcode::LCD_CLEAR:
        return "LCD_CLEAR";
      case S2COpcode::LCD_SET_CURSOR:
        return "LCD_SET_CURSOR";
      case S2COpcode::LCD_SET_TEXT_SIZE:
        return "LCD_SET_TEXT_SIZE";
      case S2COpcode::LCD_WRITE:
        return "LCD_WRITE";
      case S2COpcode::CONVEYOR_SET_SPEED:
        return "CONVEYOR_SET_SPEED";
      case S2COpcode::HTTP_BEGIN:
        return "HTTP_BEGIN";
      case S2COpcode::HTTP_WRITE:
        return "HTTP_WRITE";
      case S2COpcode::HTTP_END:
        return "HTTP_END";
      case S2COpcode::MAX_OPCODE:
        return "UNKNOWN";
    }
    return "UNKNOWN";
  }
};

#endif  // !defined(SIMULATION_MESSAGE_HPP)
