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
  SharedValues &values = ctx->getSharedValues();

  do {
    if (tagReader.isNewTagPresent()) {
      values.production.isNewTagPresent = false;

      unsigned char buffer[10];
      unsigned char size = tagReader.readTag(buffer);
      if (size > 0) {
        tag = "";
        for (unsigned char i = 0; i < size; i++) {
          char two[3];
          sniprintf(two, sizeof(two), "%02x", buffer[i]);
          tag += two;
        }
        memcpy(values.production.tag, tag.c_str(), tag.length());
        values.production.isNewTagPresent = true;

        LOG_INFO("[TAG] New Tag %s\n", tag.c_str());
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

static void sortPackages(TaskContext *ctx) {
  Sorter &sorter = ctx->getHardware()->sorter;
  SharedValues &values = ctx->getSharedValues();

  do {
    switch (static_cast<SorterDirection>(values.production.targetWarhouse)) {
      case SorterDirection::LEFT:
        sorter.move(SorterDirection::LEFT);
        break;
      case SorterDirection::MIDDLE:
        sorter.move(SorterDirection::MIDDLE);
        break;
      case SorterDirection::RIGHT:
        sorter.move(SorterDirection::RIGHT);
        break;
      default:
        LOG_WARN("[SORT.] Invalide direction: %u\n", values.production.targetWarhouse);
        sorter.move(SorterDirection::RIGHT);
        break;
    }
  } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));
}

static void makeHttpRequests(TaskContext *ctx) {
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;
  DolibarrClient &dolibarrClient = ctx->getHardware()->dolibarrClient;
  SharedValues &values = ctx->getSharedValues();

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
  values.production.dolibarrClientStatus =
      dolibarrClient.configure(webConfigurator.getApiUrl(), webConfigurator.getApiKey(), webConfigurator.getApiWarehouseError());

  LOG_DEBUG("[HTTP] Dolibarr status : %u\n", values.production.dolibarrClientStatus);

  switch (values.production.dolibarrClientStatus) {
    case DolibarrClientStatus::READY:
      do {
        if (values.production.isNewTagPresent) {
          LOG_INFO("[TAG] New Tag makeHttpRequests %s\n", values.production.tag);
          char *endptr;
          values.production.dolibarrClientStatus = dolibarrClient.sendTag(strtol(values.production.tag, &endptr, 16), product, warehouse);
          values.production.dolibarrClientStatus = dolibarrClient.sendStockMovement(warehouse, product, 1);

          values.production.targetWarhouse = warehouse;
          values.production.isNewTagPresent = false;
        }
      } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));
      break;

    default:
      LOG_ERROR("[HTTP] Dolibarr client configuration failed. Aborting.\n");
      break;
  }
}

void startProductionMode(TaskContext *ctx) {
  LOG_INFO("Starting production mode\n");

  SharedValues &values = ctx->getSharedValues();
  memset(values.production.tag, 0, 32);
  values.production.isNewTagPresent = false;
  values.production.targetWarhouse = 1;

  spawnSubTask(readButtons, ctx);
  spawnSubTask(readTagsAndRunConveyor, ctx);
  spawnSubTask(makeHttpRequests, ctx);
  spawnSubTask(sortPackages, ctx);

  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= Production Mode =");
  M5.Lcd.println("A: Start B: Mode C: Stop");
}
