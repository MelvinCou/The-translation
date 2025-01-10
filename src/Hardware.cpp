#include "Hardware.hpp"

#include <M5Stack.h>

#include "Logger.hpp"
#include "TheTranslationConfig.hpp"

Hardware::Hardware() : tagReader() {}

void Hardware::begin() {
  Serial.begin(115200);
  LOG_DEBUG("[HAL] Initializing hardware...\n");
  M5.begin(true, false, true, true);     // Init M5Stack. LCDEnable=true ; SDEnable=false ; SerialEnable=true ; I2CEnable=true
  M5.Power.begin();                      // Init power
  M5.lcd.setTextSize(SCREEN_FONT_SIZE);  // Set the text size to 2.

  sorter.begin();
  conveyor.begin(&Wire);

  Wire1.begin(2, 5);
  tagReader.begin(&Wire1);
  buttons.begin();

  // webConfigurator.reset();
  webConfigurator.configure();

  LOG_DEBUG("[HAL] Fully initialized\n");
}
