#include <esp_log.h>
#include <freertos/FreeRTOS.h>
#include <signal.h>
#include <sys/wait.h>

#include <cerrno>
#include <cstring>
#include <vector>

static char* getExecutablePath(char buf[], size_t size) {
  ssize_t res = readlink("/proc/self/exe", buf, size - 1);
  if (res < 0 || static_cast<size_t>(res) >= size) {
    return nullptr;
  }
  buf[res] = 0;
  return buf;
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
  ESP_LOGE("watchdog", "Failed to spawn simulation process %s: %s", exePath, strerror(errno));
  exit(EXIT_FAILURE);
}

static bool watchSimulationProcess(pid_t pid) {
  int status;
  do {
    pid_t waitResult;
    while ((waitResult = waitpid(pid, &status, WNOHANG)) == 0) {
      vTaskDelay(pdMS_TO_TICKS(100));
    }
    if (waitResult == -1) {
      ESP_LOGE("watchdog", "Failed to wait for child process: %s", strerror(errno));
      return false;
    }
  } while (!(WIFEXITED(status) || WIFSIGNALED(status)));

  if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
    ESP_LOGW("watchdog", "=== Simulation reset ===");
    return true;
  }
  if (WIFEXITED(status)) {
    ESP_LOGE("watchdog", "=== Simulation exited with status %d ===", WEXITSTATUS(status));
    return false;
  }
  ESP_LOGE("watchdog", "=== Simulation terminated with %s ===", strsignal(WTERMSIG(status)));
  return false;
}

static bool spawnAndWatchSimulationProcess(char const* exePath) {
  ESP_LOGI("watchdog", "=== Spawning The Translation Simulation ===");
  pid_t pid = fork();
  if (pid == -1) {
    ESP_LOGE("watchdog", "Failed to fork simulation process %s: %s", exePath, strerror(errno));
    exit(EXIT_FAILURE);
  }

  if (pid == 0) {
    startSimulationProcess(exePath);
  }
  return watchSimulationProcess(pid);
}

void watchdogMain() {
  char buf[256];
  char* exePath = getExecutablePath(buf, sizeof(buf));
  if (exePath == nullptr) {
    ESP_LOGE("watchdog", "Failed to read the executable path: %s", strerror(errno));
    exit(EXIT_FAILURE);
  }

  while (spawnAndWatchSimulationProcess(exePath)) {
    // continue
  }
}