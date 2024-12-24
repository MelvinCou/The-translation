#include <cstdlib>

void simulationMain();
void watchdogMain();

/// @brief Runs the entrypoint of the watchdog or simulation based on the environment variable.
extern "C" void app_main(void) {
  if (getenv("THE_TRANSLATION_SIMULATED") != nullptr) {
    simulationMain();
  } else {
    watchdogMain();
  }
}