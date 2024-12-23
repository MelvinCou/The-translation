#include <esp_log.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#include "simulation/SimulationServer.hpp"

void setup();
void loop();

using NoParams = void *;

static void listenTask(NoParams) {
  SimServer.run();
  vTaskDelete(nullptr);
}

[[noreturn]] static void loopTask(NoParams) {
  setup();
  xTaskCreate(listenTask, "listenTask", 8192, nullptr, 1, nullptr);
  for (;;) {
    loop();
  }
}

void printRunningRTOSTasks() {
  uint32_t ulTotalRunTime;
  UBaseType_t uxArraySize = uxTaskGetNumberOfTasks();
  auto *pxTaskStatusArray = static_cast<TaskStatus_t *>(pvPortMalloc(uxArraySize * sizeof(TaskStatus_t)));

  if (pxTaskStatusArray == nullptr) {
    ESP_LOGE("TaskStats", "Failed to allocate memory for pxTaskStatusArray");
    return;
  }
  /* Generate raw status information about each task. */
  uxArraySize = uxTaskGetSystemState(pxTaskStatusArray, uxArraySize, &ulTotalRunTime);

  ESP_LOGI("TaskStats", "%lu Tasks, total run time: %u", uxArraySize, ulTotalRunTime);
  for (UBaseType_t i = 0; i < uxArraySize; ++i) {
    ESP_LOGI("TaskStats", "name=[%s], rtc=[%u]", pxTaskStatusArray[i].pcTaskName, pxTaskStatusArray[i].ulRunTimeCounter);
  }

  /* The array is no longer needed, free the memory it consumes. */
  vPortFree(pxTaskStatusArray);
}

extern "C" void app_main(void) { xTaskCreate(loopTask, "loopTask", 8192, nullptr, 1, nullptr); }
