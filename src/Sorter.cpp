#include "Sorter.hpp"

#include <GoPlus2.h>

#include "TheTranslationConfig.hpp"
#include "taskUtil.hpp"

GoPlus2 goPlus;

void Sorter::begin() {
  goPlus.begin();
  goPlus.Servo_write_plusewidth(SORTER_SERVO_NUMBER, SORTER_SERVO_PULSE_WIDTH);
  moveWithSpecificAngle(SORTER_SERVO_RIGHT_ANGLE);
  m_currentAngle = SORTER_SERVO_RIGHT_ANGLE;
  m_desiredAngle = SORTER_SERVO_RIGHT_ANGLE;
}

void Sorter::moveWithSpecificAngle(int angle) {
  goPlus.Servo_write_angle(SORTER_SERVO_NUMBER, angle);
  m_currentAngle = angle;
}

int Sorter::getCurrentAngle() const { return m_currentAngle; }

int Sorter::getDesiredAngle() const { return m_desiredAngle; }

SorterDirection Sorter::getDesiredDirection() const {
  switch (m_desiredAngle) {
    case SORTER_SERVO_LEFT_ANGLE:
      return SorterDirection::LEFT;
    case SORTER_SERVO_MIDDLE_ANGLE:
      return SorterDirection::MIDDLE;
    case SORTER_SERVO_RIGHT_ANGLE:
      return SorterDirection::RIGHT;
    default:
      return SorterDirection::RIGHT;
  }
}

void Sorter::setDesiredAngle(SorterDirection direction) {
  switch (direction) {
    case SorterDirection::LEFT:
      m_desiredAngle = SORTER_SERVO_LEFT_ANGLE;
      break;
    case SorterDirection::MIDDLE:
      m_desiredAngle = SORTER_SERVO_MIDDLE_ANGLE;
      break;
    case SorterDirection::RIGHT:
      m_desiredAngle = SORTER_SERVO_RIGHT_ANGLE;
      break;
  }
}

void Sorter::moveToDesiredAngle(uint32_t delayMs) {
  if (getCurrentAngle() > getDesiredAngle()) {
    do {
      const int angle = getCurrentAngle() - 1;
      moveWithSpecificAngle(angle);
    } while (getCurrentAngle() > getDesiredAngle() && interruptibleTaskPauseMs(delayMs));

  } else if (getCurrentAngle() < getDesiredAngle()) {
    do {
      const int angle = getCurrentAngle() + 1;
      moveWithSpecificAngle(angle);
    } while (getCurrentAngle() < getDesiredAngle() && interruptibleTaskPauseMs(delayMs));
  }
}
