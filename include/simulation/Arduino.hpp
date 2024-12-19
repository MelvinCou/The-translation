#ifndef SIMULATION_ARDUINO_HPP
#define SIMULATION_ARDUINO_HPP

#include <cstdint>
#include <cstring>

typedef uint8_t byte;
typedef bool boolean;

#include "simulation/HardwareSerial.hpp"
#include "simulation/String.hpp"

unsigned long micros();
unsigned long millis();
void delay(uint32_t);
void delayMicroseconds(uint32_t us);

#endif  // !defined(SIMULATION_ARDUINO_HPP)
