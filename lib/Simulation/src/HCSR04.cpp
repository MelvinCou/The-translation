#include "simulation/HCSR04.hpp"

#include <esp_log.h>

#include <SimulationServer.hpp>

UltraSonicDistanceSensor::UltraSonicDistanceSensor([[maybe_unused]] byte triggerPin, [[maybe_unused]] byte echoPin,
                                                   unsigned short maxDistanceCm, unsigned long maxTimeoutMicroSec)
    : m_maxDistanceCm(maxDistanceCm),
      m_maxTimeoutMillis(maxTimeoutMicroSec / 1000),
      m_distanceNotification(xSemaphoreCreateBinary()),
      m_distance(0.f) {
  SimServer.registerEolSensorOnReadEnd([this](float distance) {
    m_distance = distance;
    xSemaphoreGive(m_distanceNotification);
  });
}

float UltraSonicDistanceSensor::measureDistanceCm() {
  SimServer.sendEolSensorReadBegin();

  if (xSemaphoreTake(m_distanceNotification, pdMS_TO_TICKS(m_maxTimeoutMillis))) {
    return m_distance > static_cast<float>(m_maxDistanceCm) ? -1.0f : m_distance;
  }
  ESP_LOGE("HCSR04", "Read timed out after %lums", m_maxTimeoutMillis);
  return -1.f;
}
