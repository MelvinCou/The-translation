#include "Hardware.hpp"

#ifdef ENV_M5STACK
#include <M5Stack.h>
#endif  // defined(ENV_M5STACK)

Hardware::Hardware() : tagReader() {}

void Hardware::begin() {
  Serial.begin(115200);
#ifdef ENV_M5STACK
  M5.begin();             // Init M5Stack.
  M5.Power.begin();       // Init power
  M5.lcd.setTextSize(2);  // Set the text size to 2.
  Wire.begin(21, 22);
  M5.Lcd.println("= Motor Test =");
  M5.Lcd.println("A: Start B: Status C: Stop");
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

  // webConfigurator.reset();
  webConfigurator.configure();
}
