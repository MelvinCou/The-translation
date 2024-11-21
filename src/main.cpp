#include "Hardware.hpp"

void startProductionMode(Hardware* hardware);
void startMaintenanceMode(Hardware* hardware);
void startConfigurationMode(Hardware* hardware);

void setup() {
  auto hardware = new Hardware();
  hardware->begin();
  startProductionMode(hardware);
}

void loop() {
  // nothing to do!
}
