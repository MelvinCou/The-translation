/**
 * @file NonBlockingGRBL.hpp
 * @brief Like Module_GRBL_13.2.h, but not completely broken beyond repair.
 */

#ifndef _NON_BLOCKING_GRBL_HPP_
#define _NON_BLOCKING_GRBL_HPP_

#ifndef HARDWARE_GRBL
#error "This file is only for use with the M5Stack Core2"
#endif  // !defined(HARDWARE_GRBL)

#include <Arduino.h>
#include <Wire.h>

enum class GRBLCancellable {
  CONTINUE,
  CANCELLED,
};

class Module_GRBL {
 private:
  void sendByte(byte b);
  void sendBytes(uint8_t *data, size_t size);
  TwoWire *_Wire;
  uint8_t _addr;

 public:
  Module_GRBL(uint8_t addr = 0x70);
  void Init(TwoWire *wire = &Wire);
  void Init(TwoWire *wire, uint32_t x_step, uint32_t y_step, uint32_t z_step, uint32_t acc);
  int addr;
  String mode;
  void sendGcode(char *c);
  void unLock();
  [[nodiscard]] GRBLCancellable readClean();
  [[nodiscard]] GRBLCancellable waitIdle();
  void setMotor(int x = 0, int y = 0, int z = 0, int speed = 300);
  void setMode(String mode);
  [[nodiscard]] GRBLCancellable readLine(String *line);
  [[nodiscard]] GRBLCancellable readStatus(String *line);
};

#endif  // !defined(_NON_BLOCKING_GRBL_HPP_)
