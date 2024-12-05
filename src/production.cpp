#include "TheTranslationConfig.hpp"

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif  // defined(ENV_M5STACK)

#include <HTTPClient.h>
#include <WiFi.h>
#include <freertos/task.h>

#include <OperationMode.hpp>
#include <TaskContext.hpp>

#include "Buttons.hpp"
#include "Hardware.hpp"
#include "Logger.hpp"
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

static void runConveyor(TaskContext *ctx) {
  Conveyor &conveyor = ctx->getHardware()->conveyor;

  do {
    conveyor.update();
  } while (conveyor.getCurrentStatus() != ConveyorStatus::CANCELLED && interruptibleTaskPauseMs(CONVEYOR_UPDATE_INTERVAL));

  LOG_DEBUG("[CONV] Stopping conveyor\n");

  conveyor.stop();
  conveyor.update();
}

static void pickRandomDirection(TaskContext *ctx) {
  Sorter &sorter = ctx->getHardware()->sorter;

  do {
    const auto direction = static_cast<SorterDirection>(random(0, 3));
    sorter.move(direction);
  } while (interruptibleTaskPauseMs(1000));

  LOG_DEBUG("[SORT] Random 'sorting' cancelled\n");

  sorter.move(SorterDirection::MIDDLE);
}

String tag = "";

static void readAndPrintTags(TaskContext *ctx) {
  TagReader &tagReader = ctx->getHardware()->tagReader;

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
      }
    }
  } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));

  LOG_DEBUG("[TAG] Stopped reading NFC tags\n");
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
  spawnSubTask(runConveyor, ctx);
  spawnSubTask(pickRandomDirection, ctx);
#if defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)
  spawnSubTask(readAndPrintTags, ctx);
#endif

  spawnSubTask(makeHttpRequests, ctx);

#ifdef ENV_M5STACK
  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= Production Mode =");
  M5.Lcd.println("A: Start B: Mode C: Stop");
#endif  // defined(ENV_M5STACK)
}
