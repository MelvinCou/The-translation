#include "TheTranslationConfig.hpp"

#include <TaskScheduler.h>

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif // defined(ENV_M5STACK)

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

}
