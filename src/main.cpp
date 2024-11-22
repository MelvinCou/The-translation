#include "TheTranslationConfig.hpp"

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif  // defined(ENV_M5STACK)

#include <HTTPClient.h>
#include <WiFi.h>

#include "Buttons.hpp"
#include "Conveyor.hpp"
#include "DolibarrClient.hpp"
#include "Logger.hpp"
#include "Sorter.hpp"
#include "TagReader.hpp"
#include "WebConfigurator.hpp"

Conveyor conveyor;
Buttons buttons;
DolibarrClient dolibarrClient;
Sorter sorter;
TagReader tagReader;
WebConfigurator webConfigurator;

void printStatus();

void readButtons(void *_nothing = nullptr);
void runConveyor(void *_nothing = nullptr);
void pickRandomDirection(void *nothing = nullptr);
void readAndPrintTags(void *_nothing = nullptr);
void makeHttpRequests(void *_nothing = nullptr);
void exposeWebConfigurator(void *_nothing = nullptr);

void setup() {
  Serial.begin(115200);
#ifdef ENV_M5STACK
  M5.begin();             // Init M5Stack.
  M5.Power.begin();       // Init power
  M5.lcd.setTextSize(2);  // Set the text size to 2.
  Wire.begin(21, 22);
  M5.Lcd.println("= Motor Test =");
  M5.Lcd.println("A: Start B: Status C: Stop");
#else
  conveyor.begin();
  Serial.flush();
#endif

#ifdef HARDWARE_GRBL
  sorter.begin();
  conveyor.begin(&Wire);
#else
  sorter.begin();
  conveyor.begin();
#endif

#ifdef HARDWARE_MFRC522_I2C
  tagReader.begin(&Wire);
#else
  tagReader.begin();
#endif

  buttons.begin();
  printStatus();

  // webConfigurator.reset();
  webConfigurator.configure();

  xTaskCreatePinnedToCore(&readButtons, "readButtons", 4096, nullptr, 8, nullptr, 0);
  xTaskCreatePinnedToCore(&runConveyor, "runConveyor", 4096, nullptr, 8, nullptr, 0);
  xTaskCreatePinnedToCore(&pickRandomDirection, "pickRandomDirection", 4096, nullptr, 8, nullptr, 0);
#if defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)
  xTaskCreatePinnedToCore(&readAndPrintTags, "readAndPrintTags", 4096, nullptr, 8, nullptr, 0);
#endif
  // For the time, we cannot do http request and connect to the web configurator
  // xTaskCreatePinnedToCore(&makeHttpRequests, "makeHttpRequests", 4096, nullptr, 8, nullptr, 1);
  xTaskCreatePinnedToCore(&exposeWebConfigurator, "exposeWebConfigurator", 4096, nullptr, 8, nullptr, 1);
}

void loop() {
  // nothing to do!
}

using NoContext = void *;

[[noreturn]] void readButtons(NoContext) {
  for (;;) {
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
      printStatus();
    }

    vTaskDelay(BUTTONS_READ_INTERVAL / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

[[noreturn]] void runConveyor(NoContext) {
  for (;;) {
    conveyor.update();
    vTaskDelay(CONVEYOR_UPDATE_INTERVAL / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

[[noreturn]] void pickRandomDirection(NoContext) {
  for (;;) {
    auto direction = static_cast<SorterDirection>(random(0, 3));
    sorter.move(direction);

    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

String tag = "";

[[noreturn]] void readAndPrintTags(NoContext) {
  for (;;) {
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
        LOG_INFO("New Tag %s\n", tag);
      }
    }
    vTaskDelay(TAG_READER_INTERVAL / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

void printStatus() {
  LOG_INFO("[CONV] Status => desired: %s, current: %s\n", CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getDesiredStatus())],
           CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getCurrentStatus())]);
}

[[noreturn]] void makeHttpRequests(NoContext) {
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

[[noreturn]] void exposeWebConfigurator(NoContext) {
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
