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
#include "taskUtil.hpp"
#include "ActiveModule.hpp"
#include "TheTranslationConfig.hpp"

static void selectMode(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  int range = 1;
  LOG_DEBUG("[MAINT.] Active Module : %s\n", ACTIVE_MODULES[static_cast<int>(ctx->getCurrentMaintenanceModule())]);
  do {
    if(ctx->getCurrentMaintenanceModule() == ActiveModule::NONE) {
      buttons.update();
      if (buttons.BtnA->wasPressed()) {
        LOG_DEBUG("[BTN] A pressed\n");
        if (range > 1) {
          range -= 1;
          // clearScreen();
          M5.Lcd.clearDisplay();
          M5.Lcd.setCursor(0,0);
          M5.Lcd.println("Maintenance Mode");
          M5.Lcd.println("A: < B: OK C: >");
          M5.Lcd.println(ACTIVE_MODULES[range]);
        }
      } else if (buttons.BtnC->wasPressed()) {
        LOG_DEBUG("[BTN] C pressed\n");
        if (range < 4 ) {
          range += 1;
          // clearScreen();
          M5.Lcd.clearDisplay();
          M5.Lcd.setCursor(0,0);
          M5.Lcd.println("Maintenance Mode");
          M5.Lcd.println("A: < B: OK C: >");
          M5.Lcd.println(ACTIVE_MODULES[range]);
        }
      }
      if (buttons.BtnB->wasPressed()) {
        LOG_DEBUG("[BTN] B pressed\n");
        switch(range) {
          case 1 : ctx->setMaintenanceActiveModule(ActiveModule::CONVEYOR); break;
          case 2 : ctx->setMaintenanceActiveModule(ActiveModule::SORTER); break;
          case 3 : ctx->setMaintenanceActiveModule(ActiveModule::TAG_READER); break;
          case 4 : ctx->setMaintenanceActiveModule(ActiveModule::DOLIBARR); break;
          case 0 :
          default:  ctx->setMaintenanceActiveModule(ActiveModule::NONE);
        }
        // clearScreen();
        M5.Lcd.clearDisplay();
        M5.Lcd.setCursor(0,0);
        M5.Lcd.println("Maintenance Mode for: ");
        M5.Lcd.println(ACTIVE_MODULES[range]);
        LOG_DEBUG("[MAINT.] Changing module: %s\n", ACTIVE_MODULES[range]);
        range = 1;
      }

      if(buttons.BtnC->pressedFor(3000)) {
        LOG_DEBUG("[MODE] Exit maintenance mode \n");
        ctx->requestOperationModeChange(OperationMode::CONFIGURATION);
      }
    }
  } while(interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));
}

static void runConveyor(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  Conveyor &conveyor = ctx->getHardware()->conveyor;
  do {
    if(ctx->getCurrentMaintenanceModule() == ActiveModule::CONVEYOR) {
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
        LOG_DEBUG("[MAINT.] Exit module %s\n",ACTIVE_MODULES[1]);
        ctx->setMaintenanceActiveModule(ActiveModule::NONE);
        // clearScreen();
        M5.Lcd.clearDisplay();
        M5.Lcd.setCursor(0,0);
        M5.Lcd.println("Maintenance Mode");
        M5.Lcd.println("A: < B: OK C: >");
      }
    }
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));
}

static void startSorter(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  Sorter &sorter = ctx->getHardware()->sorter;

  int angle = 50;
  int realPosition = 0;
  do {
    if(ctx->getCurrentMaintenanceModule() == ActiveModule::SORTER) {
      buttons.update();
      if(buttons.BtnC->wasPressed()) {
        LOG_INFO("[SORT.] INCREASE ANGLE \n");
        angle += 1;
        // clearScreen();
        M5.Lcd.clearDisplay();
        M5.Lcd.setCursor(0,0);
        M5.Lcd.println("ANGLE : ");
        M5.Lcd.print(angle);

      } else if(buttons.BtnA->wasPressed()) {
        LOG_INFO("[SORT.] DECREASE ANGLE \n");
        angle -= 1;
        // clearScreen();
        M5.Lcd.clearDisplay();
        M5.Lcd.setCursor(0,0);
        M5.Lcd.println("ANGLE : ");
        M5.Lcd.print(angle);
      } else if(buttons.BtnB->wasPressed()) {
        M5.Lcd.println("MOVE");
        if(realPosition < angle) {
          while(realPosition < angle) {
            sorter.moveWithSpecificAngle(realPosition);
            realPosition += 1;
            vTaskDelay(30);
          }
        } else if(realPosition > angle) {
          while(realPosition > angle) {
            sorter.moveWithSpecificAngle(realPosition);
            realPosition -= 1;
            vTaskDelay(30);
          }
        }
      }
      if(buttons.BtnB->pressedFor(3000)) {
        LOG_DEBUG("[MAINT.] Exit module %s\n",ACTIVE_MODULES[1]);
        ctx->setMaintenanceActiveModule(ActiveModule::NONE);
        // clearScreen();
        M5.Lcd.clearDisplay();
        M5.Lcd.setCursor(0,0);
        M5.Lcd.println("Maintenance Mode");
        M5.Lcd.println("A: < B: OK C: >");
      }
    }
  } while(interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));
}

static void readAndPrintTags(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  TagReader &tagReader = ctx->getHardware()->tagReader;
  String tag = "";

  do {
    if(ctx->getCurrentMaintenanceModule() == ActiveModule::TAG_READER) {
      buttons.update();
      if(buttons.BtnA->wasPressed()) {
        LOG_DEBUG("[TAG.] RUN TAG_READER \n");
        M5.Lcd.println("SCAN TAG");
        while(!tagReader.isNewTagPresent()) {
          M5.Lcd.print(".");
        }
        M5.Lcd.println("TAG DETECTED");
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
          M5.Lcd.println("TAG VALUE :");
          M5.Lcd.println(tag);
        }
      } else if(buttons.BtnC->wasPressed()) {
        M5.Lcd.println("STOP RFID");
      }
      if(buttons.BtnB->pressedFor(3000)) {
        LOG_DEBUG("[MAINT.] Exit module %s\n",ACTIVE_MODULES[1]);
        ctx->setMaintenanceActiveModule(ActiveModule::NONE);
        // clearScreen();
        M5.Lcd.clearDisplay();
        M5.Lcd.setCursor(0,0);
        M5.Lcd.println("Maintenance Mode");
        M5.Lcd.println("A: < B: OK C: >");
      }
    }
  } while(interruptibleTaskPauseMs(TAG_READER_INTERVAL));
}

static void makeHttpRequests(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;
  do {
    if(ctx->getCurrentMaintenanceModule() == ActiveModule::DOLIBARR) {
      buttons.update();
      if(buttons.BtnA->wasPressed()) {
        LOG_INFO("\n[HTTP] Starting!\n");
        WiFiClass::mode(WIFI_STA);  // connect to access point
        WiFi.begin(webConfigurator.getApSsid(), webConfigurator.getApPassword());
        M5.Lcd.println("Connecting to WIFI");

        while (WiFiClass::status() != WL_CONNECTED) {
          if (!interruptibleTaskPauseMs(500)) {
            LOG_DEBUG("[HTTP] Connection cancelled\n");
            return;
          }
          M5.Lcd.print(".");
        }
      } else if(buttons.BtnC->wasPressed()) {
        M5.Lcd.println("SEND PRODUCT REQUEST");
        // TODO ML print the result
      }

      if(buttons.BtnB->pressedFor(3000)) {
        LOG_DEBUG("[MAINT.] Exit module %s\n",ACTIVE_MODULES[1]);
        ctx->setMaintenanceActiveModule(ActiveModule::NONE);
        // clearScreen();
        M5.Lcd.clearDisplay();
        M5.Lcd.setCursor(0,0);
        M5.Lcd.println("Maintenance Mode");
        M5.Lcd.println("A: < B: OK C: >");
      }
    }
  } while(interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));

}

void startMaintenanceMode(TaskContext *ctx) {
  LOG_INFO("Starting maintenance mode\n");
#ifdef ENV_M5STACK
  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= Maintenance Mode =");
  M5.Lcd.println("A: < B: OK C: >");
  // M5.Lcd.println("Hold B to change to configuration mode");
#endif  // defined(ENV_M5STACK)
  ctx->setMaintenanceActiveModule(ActiveModule::NONE);
  LOG_DEBUG("[MAINT.] Active Module : %s\n", ACTIVE_MODULES[static_cast<int>(ctx->getCurrentMaintenanceModule())]);
  spawnSubTask(selectMode, ctx);
  spawnSubTask(runConveyor, ctx);
  spawnSubTask(startSorter, ctx);
  spawnSubTask(readAndPrintTags, ctx);
  spawnSubTask(makeHttpRequests, ctx);
}

// void exitModule() {
//   LOG_DEBUG("[MAINT.] Exit module \n");
//   maintenance.changeModule(static_cast<int>(ActiveModule::NONE));
//   maintenance.changeRange(0, false);
//   // clearScreen();
//   M5.Lcd.println("Maintenance Mode");
//   M5.Lcd.println("A: < B: OK C: >");
// }

// static void clearScreen() {
//   M5.Lcd.clearDisplay();
//   M5.Lcd.setCursor(0,0);
// }
