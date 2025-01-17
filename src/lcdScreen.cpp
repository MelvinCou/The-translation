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
  M5.Lcd.print("SSID=");
  M5.Lcd.println(SOFTAP_SSID);
  M5.Lcd.print("Password=");
  M5.Lcd.println(SOFTAP_PASSWORD);
  M5.Lcd.print("IP=");
  M5.Lcd.println(WiFi.softAPIP().toString());
  M5.Lcd.println();

  M5.Lcd.println("=== Wifi client ===");
  M5.Lcd.print("SSID=");
  M5.Lcd.println(conf.getApSsid());
  M5.Lcd.print("Password=");
  M5.Lcd.println(conf.getApPassword());
  M5.Lcd.println();

  M5.Lcd.println("=== Dolibarr client ===");
  M5.Lcd.print("URL=");
  M5.Lcd.println(conf.getApiUrl());
  M5.Lcd.print("KEY=");
  M5.Lcd.println(conf.getApiKey());
  M5.Lcd.print("Error warehouse=");
  M5.Lcd.println(conf.getApiWarehouseError());
  M5.Lcd.println();

  M5.Lcd.println("=== Conveyor ===");
  M5.Lcd.print("Speed=");
  M5.Lcd.println(conf.getConveyorSpeed());
  M5.Lcd.println();

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
