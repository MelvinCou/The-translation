#ifndef HARDWARE_HPP
#define HARDWARE_HPP

#include <EolSensor.hpp>

#include "Buttons.hpp"
#include "Conveyor.hpp"
#include "DolibarrClient.hpp"
#include "Sorter.hpp"
#include "TagReader.hpp"
#include "WebConfigurator.hpp"

/// @brief The one-stop shop for initializing and accessing all hardware components.
class Hardware {
 public:
  Hardware();
  ~Hardware() = default;

  /// @brief Performs initialization of all hardware abstractions in the project, must be called before doing anything else.
  void begin();

  Buttons buttons;
  Conveyor conveyor;
  Sorter sorter;
  TagReader tagReader;
  EolSensor eolSensor;
  // Not technically hardware, but close enough
  WebConfigurator webConfigurator;
  DolibarrClient dolibarrClient;
};

#endif  // !defined(HARDWARE_HPP)
