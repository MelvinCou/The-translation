#include <Arduino.h>
#include <M5Stack.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#include <TaskContext.hpp>
#include <lcdScreen.hpp>

#include "ActiveModule.hpp"
#include "Buttons.hpp"
#include "Hardware.hpp"
#include "Logger.hpp"
#include "TheTranslationConfig.hpp"
#include "taskUtil.hpp"

static void showMenu() {
  M5.Lcd.println("Maintenance Mode");
  M5.Lcd.println("A: < B: OK C: >");
}

static void quitModuleIfExitHeld(TaskContext *ctx, Buttons &buttons) {
  if (buttons.BtnB->pressedFor(HOLD_BUTTON_TIME)) {
    LOG_DEBUG("[MAINT.] Exit module %s\n", ACTIVE_MODULE_NAMES[static_cast<size_t>(ctx->getCurrentMaintenanceModule())]);
    ctx->setMaintenanceActiveModule(ActiveModule::NONE);
    clearScreen();
    showMenu();
  }
}

static void selectMode(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  int range = 1;
  LOG_DEBUG("[MAINT.] Active Module : %s\n", ACTIVE_MODULE_NAMES[static_cast<int>(ctx->getCurrentMaintenanceModule())]);
  do {
    if (ctx->getCurrentMaintenanceModule() != ActiveModule::NONE) continue;

    buttons.update();
    if (buttons.BtnA->wasPressed()) {
      LOG_DEBUG("[BTN] A pressed\n");
      if (range > 1) {
        range -= 1;
        clearScreen();
        showMenu();
        M5.Lcd.println(ACTIVE_MODULE_NAMES[range]);
      }
    } else if (buttons.BtnC->wasPressed()) {
      LOG_DEBUG("[BTN] C pressed\n");
      if (range + 1 < ACTIVE_MODULES_SIZE) {
        range += 1;
        clearScreen();
        showMenu();
        M5.Lcd.println(ACTIVE_MODULE_NAMES[range]);
      }
    }
    if (buttons.BtnB->wasPressed()) {
      LOG_DEBUG("[BTN] B pressed\n");
      range = range < 0 || range >= ACTIVE_MODULES_SIZE ? 0 : range;
      ctx->setMaintenanceActiveModule(ACTIVE_MODULES[range]);
      clearScreen();
      M5.Lcd.println("Maintenance Mode for: ");
      M5.Lcd.println(ACTIVE_MODULE_NAMES[range]);
      LOG_DEBUG("[MAINT.] Changing module: %s\n", ACTIVE_MODULE_NAMES[range]);
      range = 1;
    }

    if (buttons.BtnC->pressedFor(HOLD_BUTTON_TIME)) {
      LOG_DEBUG("[MODE] Exit maintenance mode \n");
      ctx->requestOperationModeChange(OperationMode::CONFIGURATION);
    }
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));
}

static void runConveyor(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  Conveyor &conveyor = ctx->getHardware()->conveyor;
  do {
    if (ctx->getCurrentMaintenanceModule() != ActiveModule::CONVEYOR) continue;

    buttons.update();
    conveyor.update();
    if (buttons.BtnA->wasPressed()) {
      LOG_DEBUG("[CONV.] RUN CONVEYOR \n");
      M5.Lcd.println("RUN MOTOR");
      conveyor.start();
    } else if (buttons.BtnC->wasPressed()) {
      M5.Lcd.println("STOP MOTOR");
      conveyor.stop();
    }

    quitModuleIfExitHeld(ctx, buttons);
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));
}

static void startSorter(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  Sorter &sorter = ctx->getHardware()->sorter;

  int angle = 50;
  int realPosition = 0;
  do {
    if (ctx->getCurrentMaintenanceModule() != ActiveModule::SORTER) continue;

    buttons.update();
    if (buttons.BtnC->wasPressed()) {
      LOG_INFO("[SORT.] INCREASE ANGLE \n");
      angle += 1;

      clearScreen();
      M5.Lcd.println("ANGLE : ");
      M5.Lcd.print(angle);
    } else if (buttons.BtnA->wasPressed()) {
      LOG_INFO("[SORT.] DECREASE ANGLE \n");
      angle -= 1;
      clearScreen();
      M5.Lcd.println("ANGLE : ");
      M5.Lcd.print(angle);

    } else if (buttons.BtnB->wasPressed()) {
      M5.Lcd.println("MOVE");
      if (realPosition < angle) {
        do {
          sorter.moveWithSpecificAngle(realPosition);
          realPosition += 1;
        } while (realPosition < angle && interruptibleTaskPauseMs(CHANGE_ANGLE_DELAY));

      } else if (realPosition > angle) {
        do {
          sorter.moveWithSpecificAngle(realPosition);
          realPosition -= 1;
        } while (realPosition > angle && interruptibleTaskPauseMs(CHANGE_ANGLE_DELAY));
      }
    }
    quitModuleIfExitHeld(ctx, buttons);
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));
}

static void readAndPrintTags(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  TagReader &tagReader = ctx->getHardware()->tagReader;
  String tag = "";

  do {
    if (ctx->getCurrentMaintenanceModule() != ActiveModule::TAG_READER) continue;

    buttons.update();
    if (buttons.BtnA->wasPressed()) {
      LOG_DEBUG("[TAG.] RUN TAG_READER \n");
      M5.Lcd.println("SCAN TAG");
      while (!tagReader.isNewTagPresent()) {
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
    } else if (buttons.BtnC->wasPressed()) {
      M5.Lcd.println("STOP RFID");
    }
    quitModuleIfExitHeld(ctx, buttons);
  } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));
}

static void makeHttpRequests(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;
  DolibarrClient &dolibarrClient = ctx->getHardware()->dolibarrClient;
  do {
    if (ctx->getCurrentMaintenanceModule() != ActiveModule::DOLIBARR) continue;

    buttons.update();
    if (buttons.BtnA->wasPressed()) {
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
      M5.Lcd.println("Connection successful");

    } else if (buttons.BtnC->wasPressed()) {
      M5.Lcd.println("SEND STATUS REQUEST");
      DolibarrClientStatus dolibarrStatus =
          dolibarrClient.configure(webConfigurator.getApiUrl(), webConfigurator.getApiKey(), webConfigurator.getApiWarehouseError());
      LOG_DEBUG("[HTTP] Dolibarr status : %u\n", dolibarrStatus);
      if (dolibarrStatus == DolibarrClientStatus::READY) {
        M5.Lcd.println("Successful Request to Dolibarr - Status READY");
      } else {
        M5.Lcd.println("Failed Request to Dolibarr - Status ERROR");
      }
    }
    quitModuleIfExitHeld(ctx, buttons);
  } while (interruptibleTaskPauseMs(BUTTONS_READ_INTERVAL));
}

static void readEolSensor(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  EolSensor &eolSensor = ctx->getHardware()->eolSensor;

  do {
    if (ctx->getCurrentMaintenanceModule() != ActiveModule::EOL_SENSOR) continue;

    buttons.update();
    if (buttons.BtnA->wasPressed()) {
      LOG_DEBUG("[EOL] READ SENSOR\n");
      if (eolSensor.hasObject()) {
        M5.Lcd.println("OBJECT DETECTED");
      } else {
        M5.Lcd.println("NO DETECTED OBJECT");
      }
    }
    quitModuleIfExitHeld(ctx, buttons);
  } while (interruptibleTaskPauseMs(EOL_SENSOR_INTERVAL));
}

void startMaintenanceMode(TaskContext *ctx) {
  LOG_INFO("Starting maintenance mode\n");
  clearScreen();
  showMenu();
  M5.Lcd.println("Hold C to change to configuration mode");
  ctx->setMaintenanceActiveModule(ActiveModule::NONE);
  LOG_DEBUG("[MAINT.] Active Module : %s\n", ACTIVE_MODULE_NAMES[static_cast<int>(ctx->getCurrentMaintenanceModule())]);
  spawnSubTask(selectMode, ctx);
  spawnSubTask(runConveyor, ctx);
  spawnSubTask(startSorter, ctx);
  spawnSubTask(readAndPrintTags, ctx);
  spawnSubTask(makeHttpRequests, ctx);
  spawnSubTask(readEolSensor, ctx);
}
