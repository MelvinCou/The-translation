#ifndef SIMULATION_HARDWARE_SERIAL_HPP
#define SIMULATION_HARDWARE_SERIAL_HPP

#include "simulation/Print.hpp"

class HardwareSerial : public Print {
 public:
  void begin(unsigned long baud);

  size_t write(uint8_t) override;
  size_t write(const uint8_t *buffer, size_t size) override;
};

extern HardwareSerial Serial;

#endif  // !defined(SIMULATION_HARDWARE_SERIAL_HPP)
