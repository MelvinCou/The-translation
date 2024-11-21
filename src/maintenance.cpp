#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#include "Logger.hpp"
#include "taskUtil.hpp"

class Hardware;
[[noreturn]] static void someRandomMaintenanceMode(const Hardware *) {
  // do stuff...
  exitCurrentTask();
}

const TaskFunction_t someRandomMaintenanceModeTask = reinterpret_cast<TaskFunction_t>(&someRandomMaintenanceMode);

void startMaintenanceMode(Hardware *hardware) {
  LOG_INFO("Starting maintenance mode\n");
  xTaskCreate(someRandomMaintenanceModeTask, "someRandomMaintenanceMode", 4096, hardware, 8, nullptr);
}
