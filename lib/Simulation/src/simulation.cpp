#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#include "simulation/SimulationServer.hpp"

void setup();
void loop();

static void listenTask(void*) {
  SimServer.run();
  vTaskDelete(nullptr);
}

[[noreturn]] static void loopTask(void*) {
  xTaskCreate(listenTask, "listenTask", 8192, nullptr, 1, nullptr);
  setup();
  for (;;) {
    loop();
  }
}

void simulationMain() { xTaskCreate(loopTask, "loopTask", 8192, nullptr, 1, nullptr); }