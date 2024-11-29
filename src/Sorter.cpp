#include "Sorter.hpp"

#include "TheTranslationConfig.hpp"

#if SORTER_DIRECTION_LEFT_PIN >= 0 || SORTER_DIRECTION_MIDDLE_PIN >= 0 || SORTER_DIRECTION_RIGHT_PIN >= 0
#include <Arduino.h>
#endif  // SORTER_DIRECTION_LEFT_PIN >= 0 || SORTER_DIRECTION_MIDDLE_PIN >= 0 || SORTER_DIRECTION_RIGHT_PIN >= 0

#ifdef HARDWARE_GOPLUS2

#include <GoPlus2.h>

GoPlus2 goPlus;

void Sorter::begin() {
  goPlus.begin();
  goPlus.Servo_write_plusewidth(SORTER_SERVO_NUMBER, SORTER_SERVO_PULSE_WIDTH);
}

void Sorter::move(SorterDirection direction) {
  switch (direction) {
    case SorterDirection::LEFT:
      goPlus.Servo_write_angle(SORTER_SERVO_NUMBER, SORTER_SERVO_LEFT_ANGLE);
      break;
    case SorterDirection::MIDDLE:
      goPlus.Servo_write_angle(SORTER_SERVO_NUMBER, SORTER_SERVO_MIDDLE_ANGLE);
      break;
    case SorterDirection::RIGHT:
      goPlus.Servo_write_angle(SORTER_SERVO_NUMBER, SORTER_SERVO_RIGHT_ANGLE);
      break;
  }
}

void Sorter::moveWithSpecificAngle(int angle) {
  goPlus.Servo_write_angle(SORTER_SERVO_NUMBER,angle);
}

#else

void Sorter::begin() {
#if SORTER_DIRECTION_LEFT_PIN >= 0
  pinMode(SORTER_DIRECTION_LEFT_PIN, OUTPUT);
  digitalWrite(SORTER_DIRECTION_LEFT_PIN, LOW);
#endif  // SORTER_DIRECTION_LEFT_PIN >= 0
#if SORTER_DIRECTION_MIDDLE_PIN >= 0
  pinMode(SORTER_DIRECTION_MIDDLE_PIN, OUTPUT);
  digitalWrite(SORTER_DIRECTION_MIDDLE_PIN, LOW);
#endif  // SORTER_DIRECTION_MIDDLE_PIN >= 0
#if SORTER_DIRECTION_RIGHT_PIN >= 0
  pinMode(SORTER_DIRECTION_RIGHT_PIN, OUTPUT);
  digitalWrite(SORTER_DIRECTION_RIGHT_PIN, LOW);
#endif  // SORTER_DIRECTION_RIGHT_PIN >= 0

  this->move(SorterDirection::MIDDLE);
}

void Sorter::move(SorterDirection direction) {
#if SORTER_DIRECTION_LEFT_PIN >= 0
  pinMode(SORTER_DIRECTION_LEFT_PIN, OUTPUT);
  digitalWrite(SORTER_DIRECTION_LEFT_PIN, direction == SorterDirection::LEFT ? HIGH : LOW);
#endif  // SORTER_DIRECTION_LEFT_PIN >= 0
#if SORTER_DIRECTION_MIDDLE_PIN >= 0
  pinMode(SORTER_DIRECTION_MIDDLE_PIN, OUTPUT);
  digitalWrite(SORTER_DIRECTION_MIDDLE_PIN, direction == SorterDirection::MIDDLE ? HIGH : LOW);
#endif  // SORTER_DIRECTION_MIDDLE_PIN >= 0
#if SORTER_DIRECTION_RIGHT_PIN >= 0
  pinMode(SORTER_DIRECTION_RIGHT_PIN, OUTPUT);
  digitalWrite(SORTER_DIRECTION_RIGHT_PIN, direction == SorterDirection::RIGHT ? HIGH : LOW);
#endif  // SORTER_DIRECTION_RIGHT_PIN >= 0
}

#endif  // defined(HARDWARE_GOPLUS2)
