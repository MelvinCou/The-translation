#ifndef LCD_SCREEN_HPP
#define LCD_SCREEN_HPP

#include "Conveyor.hpp"
#include "DolibarrClient.hpp"
#include "Sorter.hpp"
#include "TagReader.hpp"
#include "WebConfigurator.hpp"

void clearScreen();

void printConfiguration(WebConfigurator& conf);

void printProductionStatus(DolibarrClientStatus dolibarr, ConveyorStatus conveyor, TagReaderStatus tagReader, SorterDirection sorter);

void printLogScreen();

#endif
