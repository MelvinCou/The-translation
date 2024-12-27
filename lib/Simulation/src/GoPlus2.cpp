#include "simulation/GoPlus2.hpp"

#include <SimulationServer.hpp>

GoPlus2::GoPlus2() {}

void GoPlus2::begin() { SimServer.sendSorterSetAngle(0); }

void GoPlus2::Servo_write_angle([[maybe_unused]] uint8_t number, uint8_t angle) { SimServer.sendSorterSetAngle(angle); }

void GoPlus2::Servo_write_plusewidth([[maybe_unused]] uint8_t number, [[maybe_unused]] uint16_t width) {
  // TODO: stub
}
