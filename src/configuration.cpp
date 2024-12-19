#include <Arduino.h>
#include <M5Stack.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#include <TaskContext.hpp>

#include "Buttons.hpp"
#include "Hardware.hpp"
#include "Logger.hpp"
#include "TheTranslationConfig.hpp"
#include "lcdScreen.hpp"
#include "taskUtil.hpp"

static void printHeader() {
  clearScreen();
  M5.Lcd.println("= Configuration Mode =");
  M5.Lcd.println("B: Mode C: Show/Hide configuration");
  M5.Lcd.println();
}

static void printIP() {
  M5.Lcd.print("Server IP=");
#ifndef ENV_SIMULATION
  M5.Lcd.println(WiFi.softAPIP().toString());
#endif
}

static void readButtons(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  bool showConfig = true;

  do {
    buttons.update();

    if (buttons.BtnB->wasPressed()) {
      LOG_DEBUG("[BTN] B pressed\n");
      ctx->requestOperationModeChange(OperationMode::PRODUCTION);
    }

    if (buttons.BtnC->wasPressed()) {
      LOG_DEBUG("[BTN] C pressed\n");
      printHeader();
      if (showConfig) {
        printConfiguration(ctx->getHardware()->webConfigurator);
      } else {
        printIP();
      }
      showConfig = !showConfig;
    }
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));

  LOG_DEBUG("[BTN] Stopped reading buttons\n");
}

static void exposeWebConfigurator(TaskContext *ctx) {
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;
#ifndef ENV_SIMULATION
  WiFiClass::mode(WIFI_AP);  // expose access point
  WiFi.softAP(SOFTAP_SSID, SOFTAP_PASSWORD);
#endif
  
  printIP();

  webConfigurator.serverListen();

  do {
    webConfigurator.handleClient();
  } while (interruptibleTaskPauseMs(100));

  webConfigurator.serverClose();

  LOG_DEBUG("[CONF] Stopping Conf server\n");
}

void startConfigurationMode(TaskContext *ctx) {
  LOG_INFO("Starting configuration mode\n");

  printHeader();

  spawnSubTask(exposeWebConfigurator, ctx);
  spawnSubTask(readButtons, ctx);
}
