#include <esp_log.h>
#include <fcntl.h>
#include <unistd.h>

#include <cstdio>
#include <cstdlib>

void simulationMain();
void watchdogMain();

int loggerOutputFd = -1;
static vprintf_like_t originalLogger = nullptr;

/// @brief Logs to a file in addition to the default logger.
int __attribute__((format(printf, 1, 0))) logToFile(char const *fmt, va_list args) {
  va_list argsCopy;
  va_copy(argsCopy, args);
  vdprintf(loggerOutputFd, fmt, argsCopy);
  return originalLogger(fmt, args);
}

/// @brief Runs the entrypoint of the watchdog or simulation based on the environment variable.
extern "C" void app_main(void) {
  if (getenv("THE_TRANSLATION_SIMULATED") != nullptr) {
    loggerOutputFd = open("/tmp/the-translation.log", O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0644);
    originalLogger = esp_log_set_vprintf(logToFile);
    simulationMain();
  } else {
    loggerOutputFd = open("/tmp/the-translation.log", O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC, 0644);
    originalLogger = esp_log_set_vprintf(logToFile);
    watchdogMain();
  }
}