#ifndef SIMULATION_GO_PLUS_2_HPP
#define SIMULATION_GO_PLUS_2_HPP

#include <cstdint>

class GoPlus2 {
 public:
  GoPlus2();
  void begin();

  void Servo_write_angle(uint8_t number, uint8_t angle);
  void Servo_write_plusewidth(uint8_t number, uint16_t width);
};

#endif  // !defined(SIMULATION_GO_PLUS_2_HPP)
