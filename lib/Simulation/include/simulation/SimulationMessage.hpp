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
  CONFIG_SET_VALUE,
  CONFIG_FULL_READ_END,
  NFC_SET_VERSION,
  NFC_SET_CARD,
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

struct __attribute__((packed)) I2CAddress {
  uint8_t busId;
  uint8_t addr;

  constexpr explicit operator uint16_t() const { return (busId << 8) | addr; }
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
    struct {
      uint8_t nameLen;
      uint8_t valueLen;
      uint8_t buf[255];
    } configSetValue;
    struct {
      I2CAddress addr;
      uint8_t version;
    } nfcSetVersion;
    struct {
      I2CAddress addr;
      uint8_t uidLen;
      uint8_t sak;
      uint8_t uid[10];
    } nfcSetCard;
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
      case C2SOpcode::CONFIG_SET_VALUE:
        return 3;
      case C2SOpcode::NFC_SET_CARD:
        return 5;
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
      case C2SOpcode::CONFIG_SET_VALUE:
        return std::min(static_cast<size_t>(configSetValue.nameLen + configSetValue.valueLen), sizeof(configSetValue.buf));
      case C2SOpcode::NFC_SET_VERSION:
        return sizeof(nfcSetVersion);
      case C2SOpcode::NFC_SET_CARD:
        return std::min(static_cast<size_t>(nfcSetCard.uidLen), sizeof(nfcSetCard.uid));
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
      case C2SOpcode::CONFIG_SET_VALUE:
        return "CONFIG_SET_VALUE";
      case C2SOpcode::CONFIG_FULL_READ_END:
        return "CONFIG_FULL_READ_END";
      case C2SOpcode::NFC_SET_VERSION:
        return "NFC_SET_VERSION";
      case C2SOpcode::NFC_SET_CARD:
        return "NFC_SET_CARD";
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
  CONFIG_SCHEMA_RESET,
  CONFIG_SCHEMA_DEFINE,
  CONFIG_SCHEMA_END_DEFINE,
  CONFIG_SET_EXPOSED,
  CONFIG_FULL_READ_BEGIN,
  NFC_GET_VERSION,
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
      uint8_t nameLen;
      uint8_t labelLen;
      uint8_t defaultLen;
      uint8_t buf[255];
    } configSchemaDefine;
    bool configSetExposed;
    I2CAddress nfcInitBegin;
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
      case S2COpcode::CONFIG_SCHEMA_DEFINE:
        return 5;
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
      case S2COpcode::CONFIG_SCHEMA_DEFINE:
        return std::min(static_cast<size_t>(configSchemaDefine.nameLen + configSchemaDefine.labelLen + configSchemaDefine.defaultLen),
                        sizeof(configSchemaDefine.buf));
      case S2COpcode::CONFIG_SET_EXPOSED:
        return sizeof(configSetExposed);
      case S2COpcode::NFC_GET_VERSION:
        return sizeof(nfcInitBegin);
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
      case S2COpcode::CONFIG_SCHEMA_RESET:
        return "CONFIG_SCHEMA_RESET";
      case S2COpcode::CONFIG_SCHEMA_DEFINE:
        return "CONFIG_SCHEMA_DEFINE";
      case S2COpcode::CONFIG_SCHEMA_END_DEFINE:
        return "CONFIG_SCHEMA_END_DEFINE";
      case S2COpcode::CONFIG_SET_EXPOSED:
        return "CONFIG_SET_EXPOSED";
      case S2COpcode::CONFIG_FULL_READ_BEGIN:
        return "CONFIG_FULL_READ_BEGIN";
      case S2COpcode::NFC_GET_VERSION:
        return "NFC_GET_VERSION";
      case S2COpcode::MAX_OPCODE:
        return "UNKNOWN";
    }
    return "UNKNOWN";
  }
};

#endif  // !defined(SIMULATION_MESSAGE_HPP)
