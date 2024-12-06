#ifndef LCD_SCREEN_HPP
#define LCD_SCREEN_HPP

#include "WebConfigurator.hpp"

void clearScreen();

void printConfiguration(WebConfigurator& conf);

void printProductionStatus();

void printLogScreen();

#endif
