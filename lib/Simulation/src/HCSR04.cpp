#include "simulation/HCSR04.hpp"

#include <esp_log.h>

#include <SimulationServer.hpp>

UltraSonicDistanceSensor::UltraSonicDistanceSensor([[maybe_unused]] byte triggerPin, [[maybe_unused]] byte echoPin,
                                                   unsigned short maxDistanceCm, unsigned long maxTimeoutMicroSec)
    : m_maxDistanceCm(maxDistanceCm), m_maxTimeoutMillis(maxTimeoutMicroSec / 1000), m_distance(0.f) {
  SimServer.registerEolSensorOnSetDistance([this](float distance) { m_distance.store(distance); });
}

float UltraSonicDistanceSensor::measureDistanceCm() {
  // artificial read delay
  delayMicroseconds(20);
  float distance = m_distance.load();

  if (distance < -100.f) {
    // for simulation purposes, interpret low values as no sensor connected
    delay(m_maxTimeoutMillis);
    ESP_LOGE("HCSR04", "Read timed out after %lums", m_maxTimeoutMillis);
    return -1.f;
  }
  return distance;
}
