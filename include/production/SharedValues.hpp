#ifndef SHARED_VALUES_HPP
#define SHARED_VALUES_HPP

#include "DolibarrClient.hpp"

enum class SharedValueType {
  PRODUCTION = 0,
};

struct SharedValues {
  SharedValueType type;
  union {
    struct {
      // RFID reader values
      bool isNewTagPresent;
      char tag[32];
      // API client values
      DolibarrClientStatus dolibarrClientStatus;
      int targetWarehouse;
    } production;
  };
};

#endif  // !defined(SHARED_VALUES_HPP)
