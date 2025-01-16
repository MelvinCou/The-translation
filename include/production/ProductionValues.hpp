#ifndef SHARED_VALUES_HPP
#define SHARED_VALUES_HPP

#include <cppQueue.h>

#include "DolibarrClient.hpp"
#include "TheTranslationConfig.hpp"

struct ProductionValues {
  portMUX_TYPE subTaskLock;
  /// FIFO of RFID tags (uint64_t) read by the TagReader.
  /// Push side: readTagsAndRunConveyor()
  /// Pop side: makeHttpRequests()
  cppQueue inboundTags;
  /// FIFO of SorterDirection to set for each package that crosses the EOL sensor.
  /// Push side: makeHttpRequests()
  /// Pop side: readEolSensor()
  cppQueue outboundDirs;
  /// API client values
  DolibarrClientStatus dolibarrClientStatus;

  ProductionValues()
      : subTaskLock(portMUX_INITIALIZER_UNLOCKED),
        inboundTags(sizeof(uint64_t), CONVEYOR_MAX_PACKAGES_INBOUND, FIFO),
        outboundDirs(sizeof(SorterDirection), CONVEYOR_MAX_PACKAGES_OUTBOUND, FIFO),
        dolibarrClientStatus(DolibarrClientStatus::CONFIGURING) {}
  ~ProductionValues() = default;
};

#endif  // !defined(SHARED_VALUES_HPP)
