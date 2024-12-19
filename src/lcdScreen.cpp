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
  // M5.Lcd.println(WiFi.softAPIP().toString());
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

void printProductionStatus() {
  // TODO
}

void printLogScreen() {
  // TODO
}
