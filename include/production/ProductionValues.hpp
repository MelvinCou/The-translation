#ifndef SHARED_VALUES_HPP
#define SHARED_VALUES_HPP

#include <cppQueue.h>

#include "DolibarrClient.hpp"

struct ProductionValues {
  portMUX_TYPE subTaskLock;
  // RFID reader values
  cppQueue tags;
  // API client values
  DolibarrClientStatus dolibarrClientStatus;
  int targetWarehouse;

  ProductionValues() : tags(sizeof(int), 3, cppQueueType::FIFO), targetWarehouse(3), subTaskLock(portMUX_INITIALIZER_UNLOCKED) {}
  ~ProductionValues() = default;
};

#endif  // !defined(SHARED_VALUES_HPP)
