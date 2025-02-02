#ifndef SIMULATION_HCSR04_HPP
#define SIMULATION_HCSR04_HPP

#include <freertos/FreeRTOS.h>
#include <freertos/semphr.h>

#include <atomic>

#include "simulation/Arduino.hpp"

class UltraSonicDistanceSensor {
 public:
  UltraSonicDistanceSensor(byte triggerPin, byte echoPin, unsigned short maxDistanceCm = 400, unsigned long maxTimeoutMicroSec = 0);
  float measureDistanceCm();

 private:
  unsigned short m_maxDistanceCm;
  unsigned long m_maxTimeoutMillis;

  std::atomic<float> m_distance;
};

#endif  // !defined(SIMULATION_HCSR04_HPP)
