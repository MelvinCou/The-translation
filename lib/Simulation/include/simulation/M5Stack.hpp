#ifndef SIMULATION_M5_STACK_HPP
#define SIMULATION_M5_STACK_HPP

#include "simulation/Button.hpp"
#include "simulation/M5Display.hpp"
#include "simulation/M5Power.hpp"

class M5Stack {
 public:
  M5Stack();
  void begin(bool LCDEnable = true, bool SDEnable = true, bool SerialEnable = true, bool I2CEnable = false);

  M5Display Lcd;

  POWER Power;

  Button BtnA;
  Button BtnB;
  Button BtnC;
};

extern M5Stack M5;
#define m5 M5
#define lcd Lcd

#endif  // !defined(SIMULATION_M5_STACK_HPP)
