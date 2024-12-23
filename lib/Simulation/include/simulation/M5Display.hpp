#ifndef SIMULATION_M5_DISPLAY_HPP
#define SIMULATION_M5_DISPLAY_HPP

#include "simulation/Print.hpp"

class M5Display : public Print {
 public:
  void clearDisplay();
  void setCursor(int16_t x, int16_t y);
  void setTextSize(uint8_t size);
  
  size_t write(uint8_t) override;
  size_t write(const uint8_t *buffer, size_t size) override;
};

#endif  // !defined(SIMULATION_M5_DISPLAY_HPP)
