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
#include "production/ProductionValues.hpp"
#include "taskUtil.hpp"

static void readButtons(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  Conveyor &conveyor = ctx->getHardware()->conveyor;
  TagReader &tagReader = ctx->getHardware()->tagReader;

  do {
    buttons.update();
    if (buttons.BtnA->wasPressed()) {
      LOG_DEBUG("[BTN] A pressed\n");
      conveyor.start();
      tagReader.setIsStuck(false);
      tagReader.selfTest();
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

static void readTagsAndRunConveyor(TaskContext *ctx) {
  TagReader &tagReader = ctx->getHardware()->tagReader;
  Conveyor &conveyor = ctx->getHardware()->conveyor;
  auto values = ctx->getSharedValues<ProductionValues>();

  bool wasStopped = false;
  String tag = "";
  char *endptr;
  int base10tag;
  int consecutiveTagRead = 0;
  int lastTagReadTick = 0;

  do {
    switch (tagReader.getStatus()) {
      case TagReaderStatus::READY:

        if (conveyor.getCurrentStatus() != ConveyorStatus::CANCELLED) {
          if (wasStopped) {
            wasStopped = false;
            conveyor.start();
          }
          conveyor.update();
        }

        if (tagReader.isNewTagPresent()) {
          const int currentTick = millis();
          LOG_TRACE("[TAG] lastTagReadTick %u ; currentTick %u, delta %u\n", lastTagReadTick, currentTick, currentTick - lastTagReadTick);

          if (currentTick - lastTagReadTick > TAG_READER_MIN_CONSECUTIVE_INTERVAL) {
            consecutiveTagRead = 0;

            unsigned char buffer[10];
            unsigned char size = tagReader.readTag(buffer);
            if (size > 0) {
              tag = "";
              for (unsigned char i = 0; i < size; i++) {
                char two[3];
                sniprintf(two, sizeof(two), "%02x", buffer[i]);
                tag += two;
              }
              taskENTER_CRITICAL(&values->subTaskLock);
              base10tag = strtol(tag.c_str(), &endptr, 16);
              values->tags.push(&base10tag);
              taskEXIT_CRITICAL(&values->subTaskLock);

              LOG_INFO("[TAG] New Tag %s\n", tag.c_str());
            }
          } else {
            if (!tagReader.isStuck()) {
              consecutiveTagRead++;
              if (consecutiveTagRead >= TAG_READER_MAX_CONSECUTIVE_READS) {
                LOG_ERROR("[TAG] A product is stuck!\n");
                tagReader.setIsStuck(true);
              }
            }
          }
          lastTagReadTick = currentTick;
        }
        break;
      case TagReaderStatus::ERROR:
        if (!wasStopped && conveyor.getCurrentStatus() == ConveyorStatus::RUNNING) {
          wasStopped = true;
          conveyor.stop();
          conveyor.update();
        }
        break;
      default:
        break;
    }

  } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));

  LOG_DEBUG("[TAG] Stopped reading NFC tags\n");
  LOG_DEBUG("[CONV] Stopping conveyor\n");

  conveyor.stop();
  conveyor.update();
}

static void testTagReader(TaskContext *ctx) {
  TagReader &tagReader = ctx->getHardware()->tagReader;

  do {
    tagReader.selfTest();
    if (tagReader.getStatus() == TagReaderStatus::ERROR) {
      LOG_ERROR("[TAG] Self test failed\n");
    }
  } while (interruptibleTaskPauseMs(TAG_READER_TEST_INTERVAL));
}

static void sortPackages(TaskContext *ctx) {
  Sorter &sorter = ctx->getHardware()->sorter;
  auto values = ctx->getSharedValues<ProductionValues>();

  do {
    switch (values->dolibarrClientStatus) {
      case DolibarrClientStatus::READY:
      case DolibarrClientStatus::ERROR:
        switch (static_cast<SorterDirection>(values->targetWarehouse)) {
          case SorterDirection::LEFT:
            sorter.setDesiredAngle(SorterDirection::LEFT);
            break;
          case SorterDirection::MIDDLE:
            sorter.setDesiredAngle(SorterDirection::MIDDLE);
            break;
          case SorterDirection::RIGHT:
            sorter.setDesiredAngle(SorterDirection::RIGHT);
            break;
          default:
            LOG_WARN("[SORT.] Invalid direction: %u\n", values->targetWarehouse);
            sorter.setDesiredAngle(SorterDirection::RIGHT);
            break;
        }
        if (sorter.getCurrentAngle() > sorter.getDesiredAngle()) {
          do {
            const int angle = sorter.getCurrentAngle() - 1;
            sorter.moveWithSpecificAngle(angle);
          } while (sorter.getCurrentAngle() > sorter.getDesiredAngle() && interruptibleTaskPauseMs(CHANGE_ANGLE_DELAY));

        } else if (sorter.getCurrentAngle() < sorter.getDesiredAngle()) {
          do {
            const int angle = sorter.getCurrentAngle() + 1;
            sorter.moveWithSpecificAngle(angle);
          } while (sorter.getCurrentAngle() < sorter.getDesiredAngle() && interruptibleTaskPauseMs(CHANGE_ANGLE_DELAY));
        }
        break;
      case DolibarrClientStatus::CONFIGURING:
      case DolibarrClientStatus::SENDING:
      default:
        break;
    }
  } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));
}

static void makeHttpRequests(TaskContext *ctx) {
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;
  DolibarrClient &dolibarrClient = ctx->getHardware()->dolibarrClient;
  auto values = ctx->getSharedValues<ProductionValues>();

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

  int product = 0;
  int warehouse = 0;
  int tag = 0;
  bool newTag = false;
  values->dolibarrClientStatus =
      dolibarrClient.configure(webConfigurator.getApiUrl(), webConfigurator.getApiKey(), webConfigurator.getApiWarehouseError());

  LOG_DEBUG("[HTTP] Dolibarr status : %u\n", values->dolibarrClientStatus);

  switch (values->dolibarrClientStatus) {
    case DolibarrClientStatus::READY:
      do {
        taskENTER_CRITICAL(&values->subTaskLock);
        newTag = values->tags.pop(&tag);
        taskEXIT_CRITICAL(&values->subTaskLock);

        if (newTag) {
          values->dolibarrClientStatus = dolibarrClient.sendTag(tag, product, warehouse);
          values->dolibarrClientStatus = dolibarrClient.sendStockMovement(warehouse, product, 1);

          values->targetWarehouse = warehouse;
        }
      } while (interruptibleTaskPauseMs(TAG_READER_INTERVAL));
      break;
    default:
      LOG_ERROR("[HTTP] Dolibarr client configuration failed. Aborting.\n");
      break;
  }
}

static void readEolSensor(TaskContext *ctx) {
  EolSensor &eolSensor = ctx->getHardware()->eolSensor;
  do {
    if (eolSensor.hasObject()) {
      // TODO: add actual logic here
      LOG_INFO("[EOL] Object detected\n");
    }
  } while (interruptibleTaskPauseMs(EOL_SENSOR_INTERVAL));
}

void startProductionMode(TaskContext *ctx) {
  LOG_INFO("Starting production mode\n");

  ctx->setSharedValues(new ProductionValues());

  spawnSubTask(readButtons, ctx);
  spawnSubTask(readTagsAndRunConveyor, ctx);
  spawnSubTask(testTagReader, ctx);
  spawnSubTask(makeHttpRequests, ctx);
  spawnSubTask(sortPackages, ctx);
  spawnSubTask(readEolSensor, ctx);

  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= Production Mode =");
  M5.Lcd.println("A: Start B: Mode C: Stop");
}
