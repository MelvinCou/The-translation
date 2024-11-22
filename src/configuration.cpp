#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif  // defined(ENV_M5STACK)

#include <TaskContext.hpp>

#include "Buttons.hpp"
#include "Hardware.hpp"
#include "Logger.hpp"
#include "taskUtil.hpp"

[[deprecated("TEMPORARY CODE: replace with actual configuration routines")]]
static void temporaryFakeConfigurationModeTask(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;

  do {
    buttons.update();
    if (buttons.BtnB->wasPressed()) {
      LOG_DEBUG("[BTN] B pressed\n");
      ctx->requestOperationModeChange(OperationMode::PRODUCTION);
    }
  } while (interruptibleTaskPauseMs(100));
}

void startConfigurationMode(TaskContext *ctx) {
  LOG_INFO("Starting configuration mode\n");
#ifdef ENV_M5STACK
  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= FAKE Config. Mode =");
  M5.Lcd.println("B: Mode");
#endif  // defined(ENV_M5STACK)
  spawnSubTask(temporaryFakeConfigurationModeTask, ctx);
}
