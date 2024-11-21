#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#include "Logger.hpp"
#include "taskUtil.hpp"

class Hardware;
[[noreturn]] static void someRandomConfigurationMode(const Hardware *) {
  // do stuff...
  exitCurrentTask();
}

const TaskFunction_t someRandomConfigurationModeTask = reinterpret_cast<TaskFunction_t>(&someRandomConfigurationMode);

void startConfigurationMode(Hardware *hardware) {
  LOG_INFO("Starting maintenance mode\n");
  xTaskCreate(someRandomConfigurationModeTask, "someRandomMaintenanceMode", 4096, hardware, 8, nullptr);
}
