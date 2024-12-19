#include <HTTPClient.h>
#include <M5Stack.h>
#include <WiFi.h>
#include <freertos/task.h>

#include <OperationMode.hpp>
#include <TaskContext.hpp>

#include "Buttons.hpp"
#include "Hardware.hpp"
#include "Logger.hpp"
#include "TheTranslationConfig.hpp"
#include "taskUtil.hpp"

static void readButtons(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  Conveyor &conveyor = ctx->getHardware()->conveyor;

  do {
    buttons.update();
    if (buttons.BtnA->wasPressed()) {
      LOG_DEBUG("[BTN] A pressed\n");
      conveyor.start();
    } else if (buttons.BtnC->wasPressed()) {
      LOG_DEBUG("[BTN] C pressed\n");
      conveyor.stop();
    }

    if (buttons.BtnB->wasPressed()) {
      LOG_DEBUG("[BTN] B pressed\n");
      ctx->requestOperationModeChange(OperationMode::MAINTENANCE);
    }
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));

  LOG_DEBUG("[BTN] Stopped reading buttons\n");
}

String tag = "";

static void readTagsAndRunConveyor(TaskContext *ctx) {
  TagReader &tagReader = ctx->getHardware()->tagReader;
  Conveyor &conveyor = ctx->getHardware()->conveyor;
  Sorter &sorter = ctx->getHardware()->sorter;

  do {
    if (tagReader.isNewTagPresent()) {
      unsigned char buffer[10];
      unsigned char size = tagReader.readTag(buffer);
      if (size > 0) {
        tag = "";
        for (unsigned char i = 0; i < size; i++) {
          char two[3];
          sniprintf(two, sizeof(two), "%02x", buffer[i]);
          tag += two;
        }
        LOG_INFO("[TAG] New Tag %s\n", tag.c_str());
        if (tag == "9de7d6df") {
          // hardcoded yellow cube
          sorter.move(SorterDirection::LEFT);
        } else if (tag == "7d3dd4df") {
          // hardcoded green cube
          sorter.move(SorterDirection::RIGHT);
        } else {
          sorter.move(SorterDirection::MIDDLE);
        }
      }
    }
    if (conveyor.getCurrentStatus() != ConveyorStatus::CANCELLED) {
      conveyor.update();
    }
  } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));

  LOG_DEBUG("[TAG] Stopped reading NFC tags\n");
  LOG_DEBUG("[CONV] Stopping conveyor\n");

  conveyor.stop();
  conveyor.update();
}

static void makeHttpRequests(TaskContext *ctx) {
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;
  DolibarrClient &dolibarrClient = ctx->getHardware()->dolibarrClient;

  WiFiClass::mode(WIFI_STA);  // connect to access point
  WiFi.begin(webConfigurator.getApSsid(), webConfigurator.getApPassword());
  LOG_INFO("[HTTP] Connecting to WIFI");

  while (WiFiClass::status() != WL_CONNECTED) {
    if (!interruptibleTaskPauseMs(500)) {
      LOG_DEBUG("[HTTP] Connection cancelled\n");
      return;
    }
    LOG_INFO(".");
  }
  LOG_INFO("\n[HTTP] Connected!\n");

  int product = 0, warehouse = 0;
  DolibarrClientStatus dolibarrStatus =
      dolibarrClient.configure(webConfigurator.getApiUrl(), webConfigurator.getApiKey(), webConfigurator.getApiWarehouseError());

  LOG_DEBUG("[HTTP] Dolibarr status : %u\n", dolibarrStatus);

  do {
    dolibarrClient.sendTag(2101204191, product, warehouse);

    dolibarrClient.sendStockMovement(warehouse, product, 1);
  } while (interruptibleTaskPauseMs(5000));
}

void startProductionMode(TaskContext *ctx) {
  LOG_INFO("Starting production mode\n");
  spawnSubTask(readButtons, ctx);
  spawnSubTask(readTagsAndRunConveyor, ctx);
  spawnSubTask(makeHttpRequests, ctx);

  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= Production Mode =");
  M5.Lcd.println("A: Start B: Mode C: Stop");
}
