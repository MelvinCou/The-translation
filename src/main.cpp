#include "TheTranslationConfig.hpp"

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif  // defined(ENV_M5STACK)

#include "Buttons.hpp"
#include "Conveyor.hpp"
#include "Logger.hpp"
#include "Sorter.hpp"
#include "TagReader.hpp"
#include "Modes.hpp"

Conveyor conveyor;
Buttons buttons;
Sorter sorter;
TagReader tagReader;
Mode mode;

void printStatus();

void readButtons(void *_nothing = nullptr);
void runConveyor(void *_nothing = nullptr);
void pickRandomDirection(void *nothing = nullptr);
void readAndPrintTags(void *_nothing = nullptr);
void makeHttpRequests(void *_nothing = nullptr);

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
  mode.begin();

  xTaskCreatePinnedToCore(&readButtons, "readButtons", 4096, nullptr, 8, nullptr, 0);
  xTaskCreatePinnedToCore(&runConveyor, "runConveyor", 4096, nullptr, 8, nullptr, 0);
  xTaskCreatePinnedToCore(&pickRandomDirection, "pickRandomDirection", 4096, nullptr, 8, nullptr, 0);
#if defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)
  xTaskCreatePinnedToCore(&readAndPrintTags, "readAndPrintTags", 4096, nullptr, 8, nullptr, 0);
#endif
  xTaskCreatePinnedToCore(&makeHttpRequests, "makeHttpRequests", 4096, nullptr, 8, nullptr, 1);
}

void loop() {
  // nothing to do!
}

void readButtons(void *_nothing) {
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

void runConveyor(void *_nothing) {
  for (;;) {
    conveyor.update();
    vTaskDelay(CONVEYOR_UPDATE_INTERVAL / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

void pickRandomDirection(void *_nothing) {
  for (;;) {
    SorterDirection direction = static_cast<SorterDirection>(random(0, 3));
    sorter.move(direction);

    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

String tag = "";

void readAndPrintTags(void *_nothing) {
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

#include <HTTPClient.h>
#include <WiFi.h>

void makeHttpRequests(void *_nothing) {
  WiFi.mode(WIFI_STA);  // connect to access point
  WiFi.begin(HTTP_AP_SSID, HTTP_AP_PASSWORD);
  LOG_INFO("[HTTP] Connecting to WIFI");

  while (WiFi.status() != WL_CONNECTED) {
    vTaskDelay(500 / portTICK_PERIOD_MS);
    LOG_INFO(".");
  }
  LOG_INFO("\n[HTTP] Connected!\n");

  for (;;) {
    HTTPClient http;

    char url[48];
    snprintf(url, sizeof(url), "%s/%s", DOLIBARR_API_URL, tag);

    LOG_INFO("[HTTP] Making HTTP request to %s...\n", url);
    http.begin(url);
    http.addHeader("DOLAPIKEY", DOLIBARR_API_KEY);

    LOG_INFO("[HTTP] GET...");
    // start connection and send HTTP header
    int httpCode = http.GET();

    // httpCode will be negative on error
    if (httpCode > 0) {
      // HTTP header has been send and Server response header has been handled
      LOG_INFO(" code: %d\n", httpCode);

#if LOG_LEVEL >= LOG_LEVEL_DEBUG
      if (httpCode == HTTP_CODE_OK) {
        String payload = http.getString();
        LOG_DEBUG("%s\n", payload.c_str());
      }
#endif  // LOG_LEVEL >= LOG_DEBUG
    } else {
      LOG_INFO(" failed, error: %s\n", http.errorToString(httpCode).c_str());
    }

    http.end();
    vTaskDelay(5000 / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}
