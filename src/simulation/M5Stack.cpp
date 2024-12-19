#include "simulation/M5Stack.hpp"

M5Stack M5;

#define DEBOUNCE_MS 10

M5Stack::M5Stack() : BtnA(0, true, DEBOUNCE_MS), BtnB(1, true, DEBOUNCE_MS), BtnC(2, true, DEBOUNCE_MS) {}

void M5Stack::begin([[maybe_unused]] bool LCDEnable, [[maybe_unused]] bool SDEnable, [[maybe_unused]] bool SerialEnable,
                    [[maybe_unused]] bool I2CEnable) {
  BtnA.begin();
  BtnB.begin();
  BtnC.begin();
  Power.begin();
}
