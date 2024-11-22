#ifndef _CONVEYOR_HPP_
#define _CONVEYOR_HPP_

#ifdef HARDWARE_GRBL
#include "NonBlockingGRBL.hpp"
#endif  // defined(HARDWARE_GRBL)

enum class ConveyorStatus {
  UNDEFINED,
  STOPPED,
  RUNNING,
  CANCELLED,
};

static const char *CONVEYOR_STATUS_STRINGS[] = {
    "UNDEFINED",
    "STOPPED",
    "RUNNING",
};

/// @brief Conveyor interface
class Conveyor {
 public:
  Conveyor();
  ~Conveyor() = default;

#ifdef HARDWARE_GRBL
  /// @brief Delayed initialization of the conveyor
  /// @param wire The I2C bus.
  void begin(TwoWire *wire);
#else
  /// @brief Delayed initialization of the conveyor
  void begin();
#endif  // defined(HARDWARE_GRBL)

  void start();
  void stop();
  void update();
  ConveyorStatus getCurrentStatus() const;
  ConveyorStatus getDesiredStatus() const;

 private:
  ConveyorStatus m_desiredStatus;
  ConveyorStatus m_currentStatus;
#ifdef HARDWARE_GRBL
  Module_GRBL m_grbl;
#else
  int m_motorDelay;
#endif  // defined(HARDWARE_GRBL)
};

#endif  // !defined(_CONVEYOR_HPP_)
