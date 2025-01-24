#include "EolSensor.hpp"

#include <TheTranslationConfig.hpp>

EolSensor::~EolSensor() {
  delete m_sensor;
  m_sensor = nullptr;
}

void EolSensor::begin(float thresholdDistance) {
  m_sensor = new UltraSonicDistanceSensor(EOL_SENSOR_TRIGGER_PIN, EOL_SENSOR_ECHO_PIN, 400, EOL_SENSOR_READ_TIMEOUT);
  m_thresholdDistance = thresholdDistance;
}

bool EolSensor::hasObject() {
  float distance = m_sensor->measureDistanceCm();
  return distance > 0 && distance < m_thresholdDistance;
}
