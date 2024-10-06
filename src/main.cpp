#include "TheTranslationConfig.hpp"

#include <TaskScheduler.h>

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif // defined(ENV_M5STACK)

#include "Logger.hpp"
#include "Buttons.hpp"
#include "Conveyor.hpp"
#include "Sorter.hpp"
#include "TagReader.hpp"

Conveyor conveyor;
Scheduler scheduler;
Buttons buttons;
Sorter sorter;
TagReader tagReader;

void printStatus();

void readButtons();
Task readButtonsTask(BUTTONS_READ_INTERVAL, TASK_FOREVER, &readButtons, &scheduler, true);

void runConveyor();
Task runConveyorTask(CONVEYOR_UPDATE_INTERVAL, TASK_FOREVER, &runConveyor, &scheduler, true);

void pickRandomDirection();
Task pickRandomDirectionTask(1 * TASK_SECOND, TASK_FOREVER, &pickRandomDirection, &scheduler, true);

void readAndPrintTags();
Task readAndPrintTagsTask(TAG_READER_INTERVAL, TASK_FOREVER, &readAndPrintTags, &scheduler, true);

void makeHttpRequest();
Task makeHttpRequestTask(5 * TASK_SECOND, TASK_FOREVER, &makeHttpRequest, &scheduler, true);

void setup()
{
#ifdef ENV_M5STACK
  M5.begin();            // Init M5Stack.
  M5.Power.begin();      // Init power
  M5.lcd.setTextSize(2); // Set the text size to 2.
  Wire.begin(21, 22);    // Wire init, adding the I2C bus.
  conveyor.begin(&Wire);
  M5.Lcd.println("= Motor Test =");
  M5.Lcd.println("A: Start B: Status C: Stop");
#else
  Serial.begin(115200);
  Serial.flush();
  conveyor.begin();
#endif
  buttons.begin();
  sorter.begin();
  tagReader.begin();
  printStatus();
}

void loop()
{
  scheduler.execute();
}

void readButtons()
{
  buttons.update();
  if (buttons.BtnA->wasPressed())
  {
    LOG_DEBUG("[BTN] A pressed\n");
    conveyor.start();
  }
  else if (buttons.BtnC->wasPressed())
  {
    LOG_DEBUG("[BTN] C pressed\n");
    conveyor.stop();
  }

  if (buttons.BtnB->wasPressed())
  {
    LOG_DEBUG("[BTN] B pressed\n");
    printStatus();
  }
}

void runConveyor()
{
  conveyor.update();
}

void pickRandomDirection()
{
  SorterDirection direction = static_cast<SorterDirection>(random(0, 3));
  sorter.move(direction);
}

void readAndPrintTags()
{
  if (!tagReader.isNewTagPresent())
    return;
  unsigned char buffer[10];
  unsigned char size = tagReader.readTag(buffer);
  if (size > 0)
  {
    LOG_INFO("New Tag: ");
    for (unsigned char i = 0; i < size; i++)
    {
      LOG_INFO(buffer[i] < 0x10 ? " 0" : " ");
      LOG_INFO("%hhx", buffer[i]);
    }
    LOG_INFO("\n");
  }
}

void printStatus()
{
  LOG_INFO("[CONV] Status => desired: %s, current: %s\n",
           CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getDesiredStatus())],
           CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getCurrentStatus())]);
}

#include <WiFi.h>
#include <WiFiMulti.h>

#include <HTTPClient.h>

WiFiMulti wifiMulti;

bool didSetup = false;

void makeHttpRequest()
{
  if (!didSetup)
  {
    didSetup = true;
    wifiMulti.addAP(HTTP_AP_SSID, HTTP_AP_PASSWORD);
  }

  LOG_INFO("Making HTTP request...\n");
  // wait for WiFi connection
  if ((wifiMulti.run() == WL_CONNECTED))
  {

    HTTPClient http;

    Serial.print("[HTTP] begin...\n");
    http.begin(HTTP_TARGET_URL);

    LOG_INFO("[HTTP] GET...\n");
    // start connection and send HTTP header
    int httpCode = http.GET();

    // httpCode will be negative on error
    if (httpCode > 0)
    {
      // HTTP header has been send and Server response header has been handled
      LOG_INFO("[HTTP] GET... code: %d\n", httpCode);

#if LOG_LEVEL >= LOG_DEBUG
      if (httpCode == HTTP_CODE_OK)
      {
        String payload = http.getString();
        LOG_DEBUG("%s\n", payload.c_str());
      }
#endif // LOG_LEVEL >= LOG_DEBUG
    }
    else
    {
      LOG_INFO("[HTTP] GET... failed, error: %s\n", http.errorToString(httpCode).c_str());
    }

    http.end();
  }
  // Make HTTP request here.
}
