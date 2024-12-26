#include "NonBlockingGRBL.hpp"

#include <SimulationMessage.hpp>
#include <SimulationServer.hpp>

#include "TheTranslationConfig.hpp"
#include "taskUtil.hpp"

Module_GRBL::Module_GRBL(uint8_t addr) : mode("IDLE") {}

void Module_GRBL::Init(TwoWire *wire) { mode = "IDLE"; }

void Module_GRBL::Init(TwoWire *wire, uint32_t x_step, uint32_t y_step, uint32_t z_step, uint32_t acc) { mode = "IDLE"; }

[[nodiscard]] GRBLCancellable Module_GRBL::readStatus(String *line) {
  if (interruptibleTaskPauseMs(1)) {
    *line = String(mode);
    return GRBLCancellable::CONTINUE;
  }
  return GRBLCancellable::CANCELLED;
}

void Module_GRBL::unLock() {
  mode = "IDLE";
  SimServer.sendConveyorSetSpeed(0);
}

void Module_GRBL::sendGcode(char *c) {
  if (strlen(c) >= 2 && c[0] == 'G' && c[1] == '1') {
    mode = "BUSY";
    SimServer.sendConveyorSetSpeed(atoi(CONVEYOR_MOTOR_SPEED));
  }
}

[[nodiscard]] GRBLCancellable Module_GRBL::readLine([[maybe_unused]] String *line) {
  // unused function
  return GRBLCancellable::CANCELLED;
}

void Module_GRBL::sendByte([[maybe_unused]] byte b) {
  // unused function
}

void Module_GRBL::sendBytes([[maybe_unused]] uint8_t *data, [[maybe_unused]] size_t size) {
  // unused function
}

[[nodiscard]] GRBLCancellable Module_GRBL::readClean() {
  // unused function
  return GRBLCancellable::CANCELLED;
}

void Module_GRBL::setMotor([[maybe_unused]] int x, [[maybe_unused]] int y, [[maybe_unused]] int z, [[maybe_unused]] int speed) {
  // unused function
}

void Module_GRBL::setMode([[maybe_unused]] String mode) {
  // unused function
}

[[nodiscard]] GRBLCancellable Module_GRBL::waitIdle() {
  // unused function
  return GRBLCancellable::CANCELLED;
}
