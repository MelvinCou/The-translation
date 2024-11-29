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
#include "TheTranslationConfig.hpp"
#include "taskUtil.hpp"

static void exposeWebConfigurator(TaskContext *ctx) {
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;
  Buttons &buttons = ctx->getHardware()->buttons;

  WiFiClass::mode(WIFI_AP);  // expose access point
  WiFi.softAP(SOFTAP_SSID, SOFTAP_PASSWORD);

#ifdef ENV_M5STACK
  M5.Lcd.print("Server IP: ");
  M5.Lcd.println(WiFi.softAPIP().toString());
#endif  // defined(ENV_M5STACK)

  webConfigurator.serverListen();

  do {
    webConfigurator.handleClient();

    buttons.update();
    if (buttons.BtnB->wasPressed()) {
      LOG_DEBUG("[BTN] B pressed\n");
      ctx->requestOperationModeChange(OperationMode::PRODUCTION);
    }
  } while (interruptibleTaskPauseMs(100));

  webConfigurator.serverClose();

  LOG_DEBUG("[CONF] Stopping Conf server\n");
}

void startConfigurationMode(TaskContext *ctx) {
  LOG_INFO("Starting configuration mode\n");
#ifdef ENV_M5STACK
  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= Configuration Mode =");
  M5.Lcd.println("B: Mode");
#endif  // defined(ENV_M5STACK)
  spawnSubTask(exposeWebConfigurator, ctx);
}
