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


void readButtons(void *_nothing = nullptr);
void runConveyor(void *_nothing = nullptr);
void startSorter(void *nothing = nullptr);
void readAndPrintTags(void *_nothing = nullptr);
void makeHttpRequests(void *_nothing = nullptr);

void testModule(void * _nothing = nullptr);
void showChoices(void * _nothing = nullptr);

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

#ifdef HARDWARE_MFRC522_I2C
  tagReader.begin(&Wire);
#else
  tagReader.begin();
#endif

  buttons.begin();

  xTaskCreatePinnedToCore(&readButtons, "readButtons", 4096, nullptr, 8, nullptr, 0);
  xTaskCreatePinnedToCore(&testModule, "testModule", 4096, nullptr, 8, nullptr, 0);
}

void loop() {
  // nothing to do!
}

void readButtons(void *_nothing) {
  for (;;) {
    buttons.update();
    switch (maintenance.getCurrentModule()) {
      case ActiveModule::CONVEYOR : {
        if (buttons.BtnA->wasPressed()) {
          LOG_DEBUG("[BTN] A pressed\n");
          // TODO ML start conveyor

        } else if (buttons.BtnC->wasPressed()) {
          LOG_DEBUG("[BTN] C pressed\n");
          // TODO ML stop conveyor
        }
        break;
      }
      case ActiveModule::SORTER : {
        if (buttons.BtnA->wasPressed()) {
          // TODO ML decrease angle
        } else if (buttons.BtnC->wasPressed()) {
          LOG_DEBUG("[BTN] C pressed\n");
          // TODO ML increase angle
        }
        break;
      }
      case ActiveModule::TAG_READER : {
        // TODO ML nothing for now...
        break;
      }
      case ActiveModule::DOLIBARR : {
        // TODO ML send http request
        break;
      }
      case ActiveModule::NONE :
      default: {
        if (buttons.BtnA->wasPressed()) {
          LOG_DEBUG("[BTN] A pressed\n");
          if (maintenance.getRange() > 0) {
            maintenance.changeRange(-1);
          }
        } else if (buttons.BtnC->wasPressed()) {
          LOG_DEBUG("[BTN] C pressed\n");
          if (maintenance.getRange() < 3 ) {
            maintenance.changeRange(+1);
          }
        }
      }
    }

    if (buttons.BtnB->wasPressed() && maintenance.getCurrentModule() == ActiveModule::NONE ) {
      LOG_DEBUG("[BTN] B pressed\n");
      maintenance.changeModule(maintenance.getRange());
      LOG_DEBUG("[MAINT.] Changing module: %s\n", ACTIVE_MODULES_STRINGS[static_cast<int>(maintenance.getCurrentModule())]);
    } else {
      LOG_DEBUG("[MAINT.] Exit module \n");
      maintenance.changeModule(static_cast<int>(ActiveModule::NONE));
    }
    vTaskDelay(BUTTONS_READ_INTERVAL / portTICK_PERIOD_MS);
  }

  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

void testModule(void *_nothing) {
  switch (maintenance.getCurrentModule()) {
    case ActiveModule::CONVEYOR : runConveyor(); break;
    case ActiveModule::SORTER : startSorter(); break;
    case ActiveModule::TAG_READER : readAndPrintTags(); break;
    case ActiveModule::DOLIBARR : makeHttpRequests(); break;
    case ActiveModule::NONE :
    default: showChoices();
  }
  vTaskDelay(1000 / portTICK_PERIOD_MS);
  // FreeRTOS tasks are not allowed to return
  vTaskDelete(nullptr);
}

void showChoices(void *_nothing) {
  M5.lcd.println(ACTIVE_MODULES_STRINGS[maintenance.getRange()]);
}

void runConveyor(void *_nothing) {
  LOG_DEBUG("[CONV.] RUN CONVEYOR \n");
}

void startSorter(void *_nothing) {
  LOG_DEBUG("[SORTER] RUN SORTER \n");
}

String tag = "";

void readAndPrintTags(void *_nothing) {
  LOG_DEBUG("[TAG.] RUN TAG_READER \n");
}


#include <HTTPClient.h>
#include <WiFi.h>

void makeHttpRequests(void *_nothing) {
  LOG_INFO("\n[HTTP] Starting!\n");
}
