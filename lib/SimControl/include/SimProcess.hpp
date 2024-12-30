#ifndef SIM_CONTROL_HPP
#define SIM_CONTROL_HPP
#include <sys/types.h>

/// @brief RAII wrapper around a simulated process of TheTranslation.
class SimProcess {
 public:
  SimProcess();
  ~SimProcess();

  int spawn(char const *exePath = ".pio/build/m5stack-simulated/program");

 private:
  pid_t m_pid;
};

#endif  // !defined(SIM_CONTROL_HPP)