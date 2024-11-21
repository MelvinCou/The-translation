#include "TheTranslationConfig.hpp"

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif  // defined(ENV_M5STACK)

#include "Buttons.hpp"
#include "Conveyor.hpp"
#include "Logger.hpp"
#include "Sorter.hpp"
#include "TagReader.hpp"
#include "MaintenanceMode.hpp"

Conveyor conveyor;
Buttons buttons;
Sorter sorter;
TagReader tagReader;
MaintenanceMode maintenance;


void showChoices(void *_nothing = nullptr);
void runConveyor(void *_nothing = nullptr);
void startSorter(void *nothing = nullptr);
void readAndPrintTags(void *_nothing = nullptr);
void makeHttpRequests(void *_nothing = nullptr);
void exitModule();
void clearScreen();

void setup() {
  Serial.begin(115200);
#ifdef ENV_M5STACK
  M5.begin();             // Init M5Stack.
  M5.Power.begin();       // Init power
  M5.lcd.setTextSize(2);  // Set the text size to 2.
  Wire.begin(21, 22);
  M5.Lcd.println("Maintenance Mode");
  M5.Lcd.println("A: < B: OK C: >");
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

// #ifdef HARDWARE_MFRC522_I2C
//   tagReader.begin(&Wire);
// #else
//   tagReader.begin();
// #endif

  buttons.begin();
  maintenance.begin();

  xTaskCreatePinnedToCore(&showChoices, "showChoices", 4096, nullptr, 8, nullptr, 0);
  xTaskCreatePinnedToCore(&runConveyor, "runConveyor", 4096, nullptr, 8, nullptr, 0);
  xTaskCreatePinnedToCore(&startSorter, "startSorter", 4096, nullptr, 8, nullptr, 0);
#if defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)
  // xTaskCreatePinnedToCore(&readAndPrintTags, "readAndPrintTags", 4096, nullptr, 8, nullptr, 0);
#endif
  xTaskCreatePinnedToCore(&makeHttpRequests, "makeHttpRequests", 4096, nullptr, 8, nullptr, 1);
}

void loop() {
  // nothing to do!
}

void showChoices(void *_nothing) {
  for (;;) {
    if(maintenance.getCurrentModule() == ActiveModule::NONE) {
      buttons.update();
      if (buttons.BtnA->wasPressed()) {
        LOG_DEBUG("[BTN] A pressed\n");
        if (maintenance.getRange() > 0) {
          maintenance.changeRange(-1, true);
          clearScreen();
          M5.Lcd.println("Maintenance Mode");
          M5.Lcd.println("A: < B: OK C: >");
          M5.Lcd.println(ACTIVE_MODULES_STRINGS[maintenance.getRange()]);
        }
      } else if (buttons.BtnC->wasPressed()) {
        LOG_DEBUG("[BTN] C pressed\n");
        if (maintenance.getRange() < 3 ) {
          maintenance.changeRange(+1, true);
          clearScreen();
          M5.Lcd.println("Maintenance Mode");
          M5.Lcd.println("A: < B: OK C: >");
          M5.Lcd.println(ACTIVE_MODULES_STRINGS[maintenance.getRange()]);
        }
      }
      if (buttons.BtnB->wasPressed()) {
        LOG_DEBUG("[BTN] B pressed\n");
        maintenance.changeModule(maintenance.getRange());
        clearScreen();
        M5.Lcd.println("Maintenance Mode for: ");
        M5.Lcd.println(ACTIVE_MODULES_STRINGS[static_cast<int>(maintenance.getCurrentModule())]);
        LOG_DEBUG("[MAINT.] Changing module: %s\n", ACTIVE_MODULES_STRINGS[static_cast<int>(maintenance.getCurrentModule())]);
      }
    }
    vTaskDelay(BUTTONS_READ_INTERVAL / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

void runConveyor(void *_nothing) {
  for(;;) {
    if(maintenance.getCurrentModule() == ActiveModule::CONVEYOR) {
      buttons.update();
      conveyor.update();
      if(buttons.BtnA->wasPressed()) {
        LOG_DEBUG("[CONV.] RUN CONVEYOR \n");
        M5.Lcd.println("RUN MOTOR"); // TODO ML manage speed
        conveyor.start();
      } else if(buttons.BtnC->wasPressed()) {
        M5.Lcd.println("STOP MOTOR");
        conveyor.stop();
      }

      if(buttons.BtnB->pressedFor(3000)) {
        exitModule();
      }
    }
    vTaskDelay(BUTTONS_READ_INTERVAL / portTICK_PERIOD_MS);
  }
  vTaskDelete(nullptr);
}

void startSorter(void *_nothing) {
  int angle = 50;
  int realPosition = 0;
  for(;;) {
    if(maintenance.getCurrentModule() == ActiveModule::SORTER) {
      buttons.update();
      if(buttons.BtnC->wasPressed()) {
        LOG_INFO("[SORT.] INCREASE ANGLE \n");
        angle += 1;
        clearScreen();
        M5.Lcd.println("ANGLE : ");
        M5.Lcd.print(angle);

      } else if(buttons.BtnA->wasPressed()) {
        LOG_INFO("[SORT.] DECREASE ANGLE \n");
        angle -= 1;
        clearScreen();
        M5.Lcd.println("ANGLE : ");
        M5.Lcd.print(angle);
      } else if(buttons.BtnB->wasPressed()) {
        M5.Lcd.println("MOVE");
        while(realPosition < angle) {
          sorter.moveWithSpecificAngle(realPosition);
          realPosition += 1;
          vTaskDelay(30);
        }
      }

      if(buttons.BtnB->pressedFor(3000)) {
        exitModule();
      }
    }
    vTaskDelay(BUTTONS_READ_INTERVAL / portTICK_PERIOD_MS);
  }
  vTaskDelete(nullptr);
}

String tag = "";

void readAndPrintTags(void *_nothing) {
  for(;;) {
    if(maintenance.getCurrentModule() == ActiveModule::TAG_READER) {
      buttons.update();
      if(buttons.BtnA->wasPressed()) {
        LOG_DEBUG("[TAG.] RUN TAG_READER \n");
        M5.Lcd.println("SCAN TAG");
      } else if(buttons.BtnC->wasPressed()) {
        M5.Lcd.println("STOP RFID");
      }
      // if (tagReader.isNewTagPresent()) {
      //   unsigned char buffer[10];
      //   unsigned char size = tagReader.readTag(buffer);
      //   if (size > 0) {
      //     tag = "";
      //     for (unsigned char i = 0; i < size; i++) {
      //       char two[3];
      //       sniprintf(two, sizeof(two), "%02x", buffer[i]);
      //       tag += two;
      //     }
      //     LOG_INFO("New Tag %s\n", tag);
      //     M5.Lcd.println("TAG VALUE :");
      //     M5.Lcd.println(tag);
      //   }
      // }
      if(buttons.BtnB->pressedFor(3000)) {
        exitModule();
      }
    }
    vTaskDelay(BUTTONS_READ_INTERVAL / portTICK_PERIOD_MS);
  }
  vTaskDelete(nullptr);
}


#include <HTTPClient.h>
#include <WiFi.h>

void makeHttpRequests(void *_nothing) {
  for(;;) {
    if(maintenance.getCurrentModule() == ActiveModule::DOLIBARR) {
      buttons.update();
      if(buttons.BtnA->wasPressed()) {
        LOG_INFO("\n[HTTP] Starting!\n");
        WiFi.mode(WIFI_STA);  // connect to access point
        WiFi.begin(HTTP_AP_SSID, HTTP_AP_PASSWORD);
        M5.Lcd.println("Connecting to WIFI");
        while (WiFi.status() != WL_CONNECTED) {
          vTaskDelay(500 / portTICK_PERIOD_MS);
          M5.Lcd.print(".");
        }
        M5.Lcd.println("Connecting to WIFI");

      } else if(buttons.BtnC->wasPressed()) {
        M5.Lcd.println("SEND PRODUCT REQUEST");
        // TODO ML print the result
      }

      if(buttons.BtnB->pressedFor(3000)) {
        exitModule();
      }
    }
    vTaskDelay(BUTTONS_READ_INTERVAL / portTICK_PERIOD_MS);
  }
  vTaskDelete(nullptr);
}

void exitModule() {
  LOG_DEBUG("[MAINT.] Exit module \n");
  maintenance.changeModule(static_cast<int>(ActiveModule::NONE));
  maintenance.changeRange(0, false);
  clearScreen();
  M5.Lcd.println("Maintenance Mode");
  M5.Lcd.println("A: < B: OK C: >");
}

void clearScreen() {
  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0,0);
}
