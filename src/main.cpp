// #define _TASK_SLEEP_ON_IDLE_RUN // Enable 1 ms SLEEP_IDLE powerdowns between runs if no callback methods were invoked during the pass
#define _TASK_STATUS_REQUEST // Compile with support for StatusRequest functionality - triggering tasks on status change events in addition to time only

#include <TaskScheduler.h>

#include <M5Stack.h>
#include "conveyor.hpp"

IConveyor *conveyor;
Scheduler scheduler;

void printStatus();

void readButtons();
Task readByttonsTask(10 * TASK_MILLISECOND, TASK_FOREVER, &readButtons, &scheduler, true);

void runConveyor();
Task runConveyorTask(100 * TASK_MILLISECOND, TASK_FOREVER, &runConveyor, &scheduler, true);

void setup()
{
  M5.begin();            // Init M5Stack.
  M5.Power.begin();      // Init power
  M5.lcd.setTextSize(2); // Set the text size to 2.
  Wire.begin(21, 22);    // Wire init, adding the I2C bus.  Wire
  M5.Lcd.println("= Motor Test =");
  conveyor = new GRBLConveyor(&Wire);
  conveyor->begin();
  printStatus();
}

void loop()
{
  scheduler.execute();
}

void readButtons()
{
  M5.update();
  if (M5.BtnA.wasPressed())
  {
    conveyor->start();
  }
  else if (M5.BtnC.wasPressed())
  {
    conveyor->stop();
  }

  if (M5.BtnB.wasPressed())
  {
    printStatus();
  }
}

void runConveyor()
{
  conveyor->update();
}

void printStatus()
{
  M5.Lcd.clearDisplay();
  M5.Lcd.cursor_x = 0;
  M5.Lcd.cursor_y = 0;
  M5.Lcd.println("= Motor Test =");
  M5.Lcd.println("A: Start B: Status C: Stop");

  if (conveyor->getDesiredStatus() == ConveyorStatus::RUNNING)
  {
    M5.Lcd.println("Desired: running");
  }
  else
  {
    M5.Lcd.println("Desired: stopped");
  }

  if (conveyor->getCurrentStatus() == ConveyorStatus::RUNNING)
  {
    M5.Lcd.println("Current: running");
  }
  else
  {
    M5.Lcd.println("Current: stopped");
  }
}
