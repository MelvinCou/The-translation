#include "TheTranslationConfig.hpp"

#include <TaskScheduler.h>

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif // defined(ENV_M5STACK)

#include "Buttons.hpp"
#include "Conveyor.hpp"
#include "Sorter.hpp"

Conveyor conveyor;
Scheduler scheduler;
Buttons buttons;
Sorter sorter;

void printStatus();

void readButtons();
Task readButtonsTask(BUTTONS_READ_INTERVAL, TASK_FOREVER, &readButtons, &scheduler, true);

void runConveyor();
Task runConveyorTask(CONVEYOR_UPDATE_INTERVAL, TASK_FOREVER, &runConveyor, &scheduler, true);

void pickRandomDirection();
Task pickRandomDirectionTask(1 * TASK_SECOND, TASK_FOREVER, &pickRandomDirection, &scheduler, true);

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

void pickRandomDirection()
{
  SorterDirection direction = static_cast<SorterDirection>(random(0, 3));
  sorter.move(direction);
}

void printStatus()
{
  Serial.println("== Status ==");
  Serial.print("Desired: ");
  char const *desired = CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getDesiredStatus())];
  Serial.print(desired);
  Serial.print("\nCurrent: ");
  char const *current = CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor.getCurrentStatus())];
  Serial.print(current);
  Serial.print('\n');
}
