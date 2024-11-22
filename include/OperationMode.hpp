#ifndef OPERATION_MODE_HPP
#define OPERATION_MODE_HPP

#include <freertos/FreeRTOS.h>

/// @brief Represents the main operation modes of TheTranslation™.
enum class OperationMode : uint32_t {
  UNDEFINED = 0,  ///< DO NOT USE!
  PRODUCTION,     ///< The default and normal operation mode.
  MAINTENANCE,    ///< Provides direct access to the hardware for testing purposes.
  CONFIGURATION,  ///< Exposes a Web UI for easy configuration.
};

constexpr char const* OPERATION_MODES[4] = {"UNDEFINED", "PRODUCTION", "MAINTENANCE", "CONFIGURATION"};

#endif  // !defined(OPERATION_MODE_HPP)
