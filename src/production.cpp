#include "TheTranslationConfig.hpp"

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif  // defined(ENV_M5STACK)

#include <HTTPClient.h>
#include <WiFi.h>
#include <freertos/task.h>

#include "Buttons.hpp"
#include "Hardware.hpp"
#include "Logger.hpp"
#include "taskUtil.hpp"

[[noreturn]] static void readButtons(Hardware *hardware) {
  Buttons &buttons = hardware->buttons;
  Conveyor &conveyor = hardware->conveyor;

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
      LOG_INFO("[CONV] Status => desired: %s, current: %s\n", CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getDesiredStatus())],
               CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getCurrentStatus())]);
    }
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));

  LOG_DEBUG("[BTN] Stopped reading buttons\n");

  exitCurrentTask();
}

[[noreturn]] static void runConveyor(Hardware *hardware) {
  Conveyor &conveyor = hardware->conveyor;

  do {
    conveyor.update();
  } while (interruptibleTaskPauseMs(CONVEYOR_UPDATE_INTERVAL));

  LOG_DEBUG("[CONV] Stopping conveyor\n");

  conveyor.stop();
  conveyor.update();

  exitCurrentTask();
}

[[noreturn]] static void pickRandomDirection(Hardware *hardware) {
  Sorter &sorter = hardware->sorter;

  do {
    const auto direction = static_cast<SorterDirection>(random(0, 3));
    sorter.move(direction);
  } while (interruptibleTaskPauseMs(1000));

  LOG_DEBUG("[SORT] Random 'sorting' cancelled\n");

  sorter.move(SorterDirection::MIDDLE);

  exitCurrentTask();
}

String tag = "";

[[noreturn]] static void readAndPrintTags(Hardware *hardware) {
  TagReader &tagReader = hardware->tagReader;

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

  exitCurrentTask();
}

[[noreturn]] void makeHttpRequests(Hardware *hardware) {
  WebConfigurator &webConfigurator = hardware->webConfigurator;
  DolibarrClient &dolibarrClient = hardware->dolibarrClient;

  WiFiClass::mode(WIFI_STA);  // connect to access point
  WiFi.begin(webConfigurator.getApSsid(), webConfigurator.getApPassword());
  LOG_INFO("[HTTP] Connecting to WIFI");

  while (WiFiClass::status() != WL_CONNECTED) {
    vTaskDelay(500 / portTICK_PERIOD_MS);
    LOG_INFO(".");
  }
  LOG_INFO("\n[HTTP] Connected!\n");

  int product = 0, warehouse = 0;
  DolibarrClientStatus dolibarrStatus =
      dolibarrClient.configure(webConfigurator.getApiUrl(), webConfigurator.getApiKey(), webConfigurator.getApiWarehouseError());

  LOG_DEBUG("[HTTP] Dolibarr status : %u\n", dolibarrStatus);

  for (;;) {
    dolibarrClient.sendTag(2101204191, product, warehouse);

    dolibarrClient.sendStockMovement(warehouse, product, 1);

    vTaskDelay(5000 / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

[[noreturn]] void exposeWebConfigurator(Hardware *hardware) {
  WebConfigurator &webConfigurator = hardware->webConfigurator;

  WiFiClass::mode(WIFI_AP);  // expose access point
  WiFi.softAP(SOFTAP_SSID, SOFTAP_PASSWORD);

  LOG_INFO(" Server IP: %s\n", WiFi.softAPIP().toString().c_str());

  webConfigurator.serverListen();

  // TODO: check for configuration mode
  for (;;) {
    webConfigurator.handleClient();
    vTaskDelay(500 / portTICK_PERIOD_MS);
  }

  webConfigurator.serverClose();

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

const TaskFunction_t readButtonsTask = reinterpret_cast<TaskFunction_t>(&readButtons);
const TaskFunction_t runConveyorTask = reinterpret_cast<TaskFunction_t>(&runConveyor);
const TaskFunction_t pickRandomDirectionTask = reinterpret_cast<TaskFunction_t>(&pickRandomDirection);
const TaskFunction_t makeHttpRequestsTask = reinterpret_cast<TaskFunction_t>(&makeHttpRequests);
#if defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)
const TaskFunction_t readAndPrintTagsTask = reinterpret_cast<TaskFunction_t>(&readAndPrintTags);
#endif
const TaskFunction_t exposeWebConfiguratorTask = reinterpret_cast<TaskFunction_t>(&exposeWebConfigurator);

void startProductionMode(Hardware *hardware) {
  xTaskCreate(readButtonsTask, "readButtons", 4096, hardware, 8, nullptr);
  xTaskCreate(runConveyorTask, "runConveyor", 4096, nullptr, 8, nullptr);
  xTaskCreate(pickRandomDirectionTask, "pickRandomDirection", 4096, nullptr, 8, nullptr);
#if defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)
  xTaskCreate(readAndPrintTagsTask, "readAndPrintTags", 4096, nullptr, 8, nullptr);
#endif
  // xTaskCreate(makeHttpRequestsTask, "makeHttpRequests", 4096, nullptr, 8, nullptr);
  xTaskCreate(exposeWebConfiguratorTask, "exposeWebConfigurator", 4096, nullptr, 8, nullptr);
}
