/**
 * @file NonBlockingGRBL.hpp
 * @brief Like Module_GRBL_13.2.h, but not completely broken beyond repair.
 */

#ifndef _NON_BLOCKING_GRBL_HPP_
#define _NON_BLOCKING_GRBL_HPP_

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
  [[nodiscard]] GRBLCancellable readStatus(String *line);
  void unLock();
  void sendGcode(char *c);

 private:
  int addr;
  String mode;
  [[nodiscard]] GRBLCancellable readLine(String *line);
  [[nodiscard]] GRBLCancellable readClean();
  [[nodiscard]] GRBLCancellable waitIdle();
  void setMotor(int x = 0, int y = 0, int z = 0, int speed = 300);
  void setMode(String mode);
};

#endif  // !defined(_NON_BLOCKING_GRBL_HPP_)
