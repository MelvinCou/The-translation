#include "TheTranslationConfig.hpp"

#include <TaskScheduler.h>

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif // defined(ENV_M5STACK)

#include "Buttons.hpp"
#include "Conveyor.hpp"

Conveyor conveyor;
Scheduler scheduler;
Buttons buttons;

void printStatus();

void readButtons();
Task readButtonsTask(BUTTONS_READ_INTERVAL, TASK_FOREVER, &readButtons, &scheduler, true);

void runConveyor();
Task runConveyorTask(CONVEYOR_UPDATE_INTERVAL, TASK_FOREVER, &runConveyor, &scheduler, true);

void setup()
{
#ifdef ENV_M5STACK
  M5.begin();            // Init M5Stack.
  M5.Power.begin();      // Init power
  M5.lcd.setTextSize(2); // Set the text size to 2.
  Wire.begin(21, 22);    // Wire init, adding the I2C bus.  Wire
  conveyor.begin(&Wire);
  M5.Lcd.println("= Motor Test =");
  M5.Lcd.println("A: Start B: Status C: Stop");
#else
  Serial.begin(115200);
  Serial.flush();
  conveyor.begin();
#endif
  buttons.begin();
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
    conveyor.start();
  }
  else if (buttons.BtnC->wasPressed())
  {
    conveyor.stop();
  }

  if (buttons.BtnB->wasPressed())
  {
    printStatus();
  }
}

void runConveyor()
{
  conveyor.update();
}

void printStatus()
{
  Serial.println("== Status ==");
  if (conveyor.getDesiredStatus() == ConveyorStatus::RUNNING)
  {
    Serial.println("Desired: running");
  }
  else
  {
    Serial.println("Desired: stopped");
  }

  if (conveyor.getCurrentStatus() == ConveyorStatus::RUNNING)
  {
    Serial.println("Current: running");
  }
  else
  {
    Serial.println("Current: stopped");
  }
}
