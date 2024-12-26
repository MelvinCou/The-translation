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

  /// @return The total length of the message in bytes (header + payload)
  [[nodiscard]] size_t length() const { return headerLength(opcode) + tailLength(); }

  /// @return The length of the header part of the message in bytes
  [[nodiscard]] static size_t headerLength(C2SOpcode opcode) {
    switch (opcode) {
      case C2SOpcode::HTTP_BEGIN:
        return 8;
      case C2SOpcode::HTTP_WRITE:
        return 6;
      default:
        return 1;
    }
  }

  [[nodiscard]] size_t tailLength() const {
    switch (opcode) {
      case C2SOpcode::SET_BUTTON:
        return sizeof(setButton);
      case C2SOpcode::HTTP_BEGIN:
        return std::min(static_cast<size_t>(httpBegin.len), sizeof(httpBegin.host));
      case C2SOpcode::HTTP_WRITE:
        return std::min(static_cast<size_t>(httpWrite.len), sizeof(httpWrite.buf));
      case C2SOpcode::HTTP_END:
        return sizeof(httpEnd);
      default:
        return 0;
    }
  }

  /// @return The length of the header part of the message in bytes
  [[nodiscard]] char const *name() const {
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
    struct {
      uint8_t type;
    } configSchemaDefine;
  };

  /// @return The total length of the message in bytes (header + payload)
  [[nodiscard]] size_t length() const { return headerLength(opcode) + tailLength(); }

  /// @return The length of the header part of the message in bytes
  [[nodiscard]] static size_t headerLength(S2COpcode opcode) {
    switch (opcode) {
      case S2COpcode::LCD_WRITE:
        return 2;
      case S2COpcode::HTTP_BEGIN:
        return 8;
      case S2COpcode::HTTP_WRITE:
        return 6;
      default:
        return 1;
    }
  }

  /// @return The length of the tail part of the message in bytes
  [[nodiscard]] size_t tailLength() const {
    switch (opcode) {
      case S2COpcode::LCD_SET_CURSOR:
        return sizeof(lcdSetCursor);
      case S2COpcode::LCD_SET_TEXT_SIZE:
        return sizeof(lcdSetTextSize);
      case S2COpcode::LCD_WRITE:
        return std::min(static_cast<size_t>(lcdWrite.len), sizeof(lcdWrite.buf));
      case S2COpcode::CONVEYOR_SET_SPEED:
        return sizeof(conveyorSetSpeed);
      case S2COpcode::HTTP_BEGIN:
        return std::min(static_cast<size_t>(httpBegin.len), sizeof(httpBegin.host));
      case S2COpcode::HTTP_WRITE:
        return std::min(static_cast<size_t>(httpWrite.len), sizeof(httpWrite.buf));
      case S2COpcode::HTTP_END:
        return sizeof(httpEnd);
      default:
        return 0;
    }
  }

  [[nodiscard]] char const *name() const {
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
