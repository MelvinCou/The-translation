#include "taskUtil.hpp"

#include <freertos/task.h>

bool interruptibleTaskPause(TickType_t delay) {
  uint32_t notificationBits;
  bool hasNotification = xTaskNotifyWait(0, MAIN_MODE_SWITCH_SIGNAL, &notificationBits, delay) == pdTRUE;
  bool shouldStop = hasNotification && notificationBits & MAIN_MODE_SWITCH_SIGNAL;
  return !shouldStop;
}

[[noreturn]] void exitCurrentTask() {
  vTaskDelete(nullptr);
  for (;;) {
    // This should never be reached. FreeRTOS will have already deleted the task.
  }
}
