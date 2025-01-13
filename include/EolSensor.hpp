#ifndef EOL_SENSOR_HPP
#define EOL_SENSOR_HPP

#include <HCSR04.h>

class EolSensor {
 public:
  EolSensor() = default;
  ~EolSensor();

  void begin(float thresholdDistance);
  bool hasObject();

 private:
  UltraSonicDistanceSensor *m_sensor;
  float m_thresholdDistance = 2.0f;
};

#endif  // !defined(EOL_SENSOR_HPP)
