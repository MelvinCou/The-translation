#ifndef _CONVEYOR_HPP_
#define _CONVEYOR_HPP_

#include "NonBlockingGRBL.hpp"

enum class ConveyorStatus {
  UNDEFINED,
  STOPPED,
  RUNNING,
  CANCELLED,
};

static constexpr char const *CONVEYOR_STATUS_STRINGS[] = {
    "UNDEFINED",
    "STOPPED",
    "RUNNING",
    "CANCELLED",
};

/// @brief Conveyor interface
class Conveyor {
 public:
  Conveyor();
  ~Conveyor() = default;

  /// @brief Delayed initialization of the conveyor
  /// @param wire The I2C bus.
  void begin(TwoWire *wire);

  void start();
  void stop();
  void update();
  ConveyorStatus getCurrentStatus() const;
  ConveyorStatus getDesiredStatus() const;

 private:
  ConveyorStatus m_desiredStatus;
  ConveyorStatus m_currentStatus;
  Module_GRBL m_grbl;
};

#endif  // !defined(_CONVEYOR_HPP_)
