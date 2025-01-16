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

static void displayProductionModeText() {
  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("= Production Mode =");
  M5.Lcd.println("A: Start B: Mode C: Stop");
}

static void reportStoppingError(Conveyor &conveyor, char const *msg) {
  LOG_ERROR("[CONV] Stopping conveyor: %s\n", msg);
  M5.Lcd.setTextColor(TFT_RED);
  M5.Lcd.println(msg);
  M5.Lcd.setTextColor(TFT_WHITE);
  M5.Lcd.println("Press 'A' to resume");
  conveyor.stop();
}

static void flushQueues(ProductionValues *values) {
  taskENTER_CRITICAL(&values->subTaskLock);
  values->inboundTags.flush();
  values->outboundDirs.flush();
  taskEXIT_CRITICAL(&values->subTaskLock);
}

static void readButtons(TaskContext *ctx) {
  Buttons &buttons = ctx->getHardware()->buttons;
  Conveyor &conveyor = ctx->getHardware()->conveyor;
  TagReader &tagReader = ctx->getHardware()->tagReader;

  do {
    buttons.update();
    if (buttons.BtnA->wasPressed()) {
      LOG_DEBUG("[BTN] A pressed\n");
      displayProductionModeText();
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
  int consecutiveTagRead = 0;
  unsigned long lastTagReadTick = 0;

  do {
    switch (tagReader.getStatus()) {
      case TagReaderStatus::READY:

        if (conveyor.getCurrentStatus() != ConveyorStatus::CANCELLED) {
          if (wasStopped) {
            displayProductionModeText();
            wasStopped = false;
            conveyor.start();
          }
          conveyor.update();
        }

        if (tagReader.isNewTagPresent()) {
          unsigned long currentTick = millis();
          LOG_TRACE("[TAG] lastTagReadTick %lu ; currentTick %lu, delta %lu\n", lastTagReadTick, currentTick, currentTick - lastTagReadTick);

          if (currentTick - lastTagReadTick > TAG_READER_MIN_CONSECUTIVE_INTERVAL) {
            consecutiveTagRead = 0;

            unsigned char buffer[10];
            unsigned char size = tagReader.readTag(buffer);
            if (size > 0) {
              uint64_t tag = 0;
              for (unsigned char i = 0; i < size; i++) {
                tag = (tag << 8) | buffer[i];
              }
              taskENTER_CRITICAL(&values->subTaskLock);
              bool pushed = values->inboundTags.push(&tag);
              taskEXIT_CRITICAL(&values->subTaskLock);

              if (pushed) {
                LOG_INFO("[TAG] New Tag %ld\n", tag);
              } else {
                // critical error: cannot process fast enough / blocked product(s)
                flushQueues(values);
                reportStoppingError(conveyor, "Too many inbound products");
              }
            }
          } else {
            if (!tagReader.isStuck()) {
              consecutiveTagRead++;
              if (consecutiveTagRead >= TAG_READER_MAX_CONSECUTIVE_READS) {
                // critical error: product(s) stuck
                tagReader.setIsStuck(true);
                reportStoppingError(conveyor, "A product is stuck");
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
  int sorterAngleDelay = ctx->getHardware()->webConfigurator.getSorterAngleDelay();

  do {
    switch (values->dolibarrClientStatus) {
      case DolibarrClientStatus::READY:
      case DolibarrClientStatus::ERROR:
        sorter.moveToDesiredAngle(sorterAngleDelay);
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
  Conveyor &conveyor = ctx->getHardware()->conveyor;
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
  uint64_t tag = 0;
  bool newTag = false;
  values->dolibarrClientStatus =
      dolibarrClient.configure(webConfigurator.getApiUrl(), webConfigurator.getApiKey(), webConfigurator.getApiWarehouseError());

  LOG_DEBUG("[HTTP] Dolibarr status : %u\n", values->dolibarrClientStatus);

  switch (values->dolibarrClientStatus) {
    case DolibarrClientStatus::READY:
      do {
        taskENTER_CRITICAL(&values->subTaskLock);
        newTag = values->inboundTags.pop(&tag);
        taskEXIT_CRITICAL(&values->subTaskLock);

        if (newTag) {
          values->dolibarrClientStatus = dolibarrClient.sendTag(tag, product, warehouse);
          values->dolibarrClientStatus = dolibarrClient.sendStockMovement(warehouse, product, 1);

          auto outboundDir = static_cast<SorterDirection>(warehouse - 1);
          taskENTER_CRITICAL(&values->subTaskLock);
          bool pushed = values->outboundDirs.push(&outboundDir);
          taskEXIT_CRITICAL(&values->subTaskLock);

          if (!pushed) {
            values->dolibarrClientStatus = DolibarrClientStatus::ERROR;
            flushQueues(values);
            reportStoppingError(conveyor, "Too many outbound products");
          }
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
  Sorter &sorter = ctx->getHardware()->sorter;
  WebConfigurator &webConfigurator = ctx->getHardware()->webConfigurator;

  auto values = ctx->getSharedValues<ProductionValues>();

  auto outboundDir = SorterDirection::RIGHT;
  auto errorDir = static_cast<SorterDirection>(webConfigurator.getApiWarehouseError() - 1);

  do {
    if (!eolSensor.hasObject()) continue;

    taskENTER_CRITICAL(&values->subTaskLock);
    bool hasDir = values->outboundDirs.pop(&outboundDir);
    taskEXIT_CRITICAL(&values->subTaskLock);

    if (hasDir) {
      LOG_INFO("[SORT] Routing package to %s\n", SORTER_DIRECTIONS[static_cast<size_t>(outboundDir)]);
      sorter.setDesiredAngle(outboundDir);
    } else {
      // non-critical error: just log and route to default
      LOG_ERROR("[EOL] Unexpected object detected, routing to default (%s)\n", SORTER_DIRECTIONS[static_cast<size_t>(errorDir)]);
      sorter.setDesiredAngle(errorDir);
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

  displayProductionModeText();
}
