#include "Conveyor.hpp"

#include "Logger.hpp"
#include "TheTranslationConfig.hpp"

#if CONVEYOR_CURRENT_STATUS_PIN >= 0 || CONVEYOR_DESIRED_STATUS_PIN >= 0
#include <Arduino.h>
#endif  // CONVEYOR_CURRENT_STATUS_PIN >= 0 || CONVEYOR_DESIRED_STATUS_PIN >= 0

#ifdef HARDWARE_GRBL

Conveyor::Conveyor() : m_grbl(CONVEYOR_GRBL_I2C_ADDR) {}

void Conveyor::begin(TwoWire *wire) {
  m_grbl.Init(wire);
  m_desiredStatus = ConveyorStatus::STOPPED;
  m_currentStatus = ConveyorStatus::UNDEFINED;
}

static ConveyorStatus readStatus(Module_GRBL *grbl) {
  String grblStatus = grbl->readStatus();

  if (grblStatus[0] == 'I') {
    // IDLE state
    return ConveyorStatus::STOPPED;
  } else if (grblStatus[0] == 'B') {
    // BUSY/running state
    return ConveyorStatus::RUNNING;
  } else {
    // ALARM state, or other
    return ConveyorStatus::UNDEFINED;
  }
}

void Conveyor::update() {
  [[maybe_unused]] ConveyorStatus oldStatus = m_currentStatus;
  m_currentStatus = readStatus(&m_grbl);

  if (m_currentStatus == ConveyorStatus::UNDEFINED) {
    m_grbl.unLock();
    LOG_DEBUG("[CONV] undefined state, reading status again...\n");
    m_currentStatus = readStatus(&m_grbl);
  }

#if LOG_LEVEL >= LOG_LEVEL_DEBUG
  if (oldStatus != m_currentStatus) {
    LOG_DEBUG("[CONV] Changing status: %s\n", CONVEYOR_STATUS_STRINGS[static_cast<int>(m_desiredStatus)]);
  }
#endif

  if (m_currentStatus != ConveyorStatus::RUNNING && m_desiredStatus == ConveyorStatus::RUNNING) {
    // CNC codes: https://www.cnccookbook.com/g-code-m-code-command-list-cnc-mills/
    m_grbl.sendGcode(const_cast<char *>("G91"));  // force incremental positioning
    m_grbl.sendGcode(const_cast<char *>("G21"));  // Set the unit to milimeters
    m_grbl.sendGcode(const_cast<char *>("G1 X" CONVEYOR_MOTOR_DISTANCE " Y0 Z0 F" CONVEYOR_MOTOR_SPEED));
  } else if (m_currentStatus != ConveyorStatus::STOPPED && m_desiredStatus == ConveyorStatus::STOPPED) {
    m_grbl.unLock();
  }
}

#else

Conveyor::Conveyor() {}

void Conveyor::begin() {
  LOG_DEBUG("[CONV] Initializing...\n");
  m_desiredStatus = ConveyorStatus::STOPPED;
  m_currentStatus = ConveyorStatus::STOPPED;
  m_motorDelay = 0;
#if CONVEYOR_CURRENT_STATUS_PIN >= 0
  pinMode(CONVEYOR_CURRENT_STATUS_PIN, OUTPUT);
#endif  // CONVEYOR_CURRENT_STATUS_PIN >= 0
#if CONVEYOR_DESIRED_STATUS_PIN >= 0
  pinMode(CONVEYOR_DESIRED_STATUS_PIN, OUTPUT);
#endif  // CONVEYOR_DESIRED_STATUS_PIN >= 0
}

void Conveyor::update() {
  if (m_currentStatus != m_desiredStatus && m_motorDelay++ > CONVEYOR_SIMULATED_DELAY_UPDATES) {
    LOG_DEBUG("[CONV] Changing status: %s\n", CONVEYOR_STATUS_STRINGS[static_cast<int>(m_desiredStatus)]);
    m_motorDelay = 0;
    m_currentStatus = m_desiredStatus;
  }
#if CONVEYOR_CURRENT_STATUS_PIN >= 0
  digitalWrite(CONVEYOR_CURRENT_STATUS_PIN, m_currentStatus == ConveyorStatus::RUNNING ? HIGH : LOW);
#endif  // CONVEYOR_CURRENT_STATUS_PIN >= 0
#if CONVEYOR_DESIRED_STATUS_PIN >= 0
  digitalWrite(CONVEYOR_DESIRED_STATUS_PIN, m_desiredStatus == ConveyorStatus::RUNNING ? HIGH : LOW);
#endif  // CONVEYOR_DESIRED_STATUS_PIN >= 0
}
#endif  // defined(HARDWARE_GRBL)

void Conveyor::start() {
  LOG_DEBUG("[CONV] Starting...\n");
  m_desiredStatus = ConveyorStatus::RUNNING;
}

void Conveyor::stop() {
  LOG_DEBUG("[CONV] Stopping...\n");
  m_desiredStatus = ConveyorStatus::STOPPED;
}

ConveyorStatus Conveyor::getDesiredStatus() const { return m_desiredStatus; }

ConveyorStatus Conveyor::getCurrentStatus() const { return m_currentStatus; }
