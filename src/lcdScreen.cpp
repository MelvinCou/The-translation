#include "lcdScreen.hpp"

#include <M5Stack.h>

#include "TheTranslationConfig.hpp"

void clearScreen() {
  M5.Lcd.clearDisplay();
  M5.Lcd.setCursor(0, 0);
}

void printConfiguration(WebConfigurator& conf) {
  M5.Lcd.setTextSize(1);

  M5.Lcd.println("=== SOFTAP ===");
  M5.Lcd.printf("SSID=%s\n", SOFTAP_SSID);
  M5.Lcd.printf("Password=%s\n", SOFTAP_PASSWORD);
  M5.Lcd.printf("IP=%s\n\n", WiFi.softAPIP().toString().c_str());

  M5.Lcd.println("=== Wifi client ===");
  M5.Lcd.printf("SSID=%s\n", conf.getApSsid());
  M5.Lcd.printf("Password=%s\n\n", conf.getApPassword());

  M5.Lcd.println("=== Dolibarr client ===");
  M5.Lcd.printf("URL=%s\n", conf.getApiUrl());
  M5.Lcd.printf("KEY=%s\n", conf.getApiKey());
  M5.Lcd.printf("Error warehouse=%d\n\n", conf.getApiWarehouseError());

  M5.Lcd.println("=== Conveyor ===");
  M5.Lcd.printf("Speed=%d\n\n", conf.getConveyorSpeed());

  M5.Lcd.println("=== EOL Sensor ===");
  M5.Lcd.printf("Threshold=%f\n\n", conf.getEolSensorThreshold());

  M5.Lcd.println("=== Sorter ===");
  M5.Lcd.printf("Angle delay=%d\n\n", conf.getSorterAngleDelay());

  M5.Lcd.setTextSize(SCREEN_FONT_SIZE);
}

void printProductionStatus(DolibarrClientStatus dolibarr, ConveyorStatus conveyor, TagReaderStatus tagReader, SorterDirection sorter) {
  M5.Lcd.println();

  M5.Lcd.print("Dolibarr client status : ");
  M5.Lcd.println(DOLIBARR_CLIENT_STATUS_STRINGS[static_cast<int>(dolibarr)]);

  M5.Lcd.print("Conveyor status : ");
  M5.Lcd.println(CONVEYOR_STATUS_STRINGS[static_cast<int>(conveyor)]);

  M5.Lcd.print("TagReader status : ");
  M5.Lcd.println(TAGREADER_STATUS_STRINGS[static_cast<int>(tagReader)]);

  M5.Lcd.print("Sorter direction : ");
  M5.Lcd.println(SORTER_DIRECTIONS[static_cast<int>(sorter)]);
}

void printLogScreen() {
  // TODO
}
