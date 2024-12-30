#include "SimProcess.hpp"

#include <signal.h>
#include <unistd.h>

#include <cerrno>
#include <cstdlib>
#include <cstring>
#include <vector>

SimProcess::SimProcess() : m_pid(-1) {}

SimProcess::~SimProcess() {
  if (m_pid != -1) {
    kill(m_pid, SIGKILL);
    m_pid = -1;
  }
}

[[noreturn]] static void startSimulationProcess(char const* exePath) {
  extern char** environ;
  char const* const argv[2] = {exePath, nullptr};
  std::vector<char const*> env;
  for (char** envp = environ; *envp != nullptr; ++envp) {
    env.push_back(*envp);
  }
  env.push_back("THE_TRANSLATION_SIMULATED=1");
  env.push_back(nullptr);
  execve(exePath, const_cast<char* const*>(argv), const_cast<char* const*>(env.data()));
  exit(EXIT_FAILURE);
}

int SimProcess::spawn(char const* exePath) {
  const pid_t pid = fork();
  if (pid == -1) {
    return errno;
  }

  if (pid == 0) {
    startSimulationProcess(exePath);
  }
  m_pid = pid;
  return 0;
}
