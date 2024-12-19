#include "Sorter.hpp"

#include <GoPlus2.h>

#include "TheTranslationConfig.hpp"

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

void Sorter::moveWithSpecificAngle(int angle) { goPlus.Servo_write_angle(SORTER_SERVO_NUMBER, angle); }
