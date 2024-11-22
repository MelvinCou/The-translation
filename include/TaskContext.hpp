#ifndef TASK_CONTEXT_HPP
#define TASK_CONTEXT_HPP

#include <freertos/FreeRTOS.h>
#include <freertos/semphr.h>
#include <freertos/task.h>

#include "OperationMode.hpp"

// forward declaration
class Hardware;

/// @brief The context passed to each FreeRTOS sub-task.
class TaskContext {
 public:
  static constexpr uint32_t MAX_SUB_TASKS = 16;

  explicit TaskContext(Hardware *hardware);
  ~TaskContext() = default;

  /// @brief Provides access to the hardware abstraction layer.
  constexpr Hardware *getHardware() const { return m_hardware; }

  /**
   * @defgroup TextContextSubTaskAPI Sub-task management API
   * @brief Methods that manage the lifecycle of sub-tasks in a thread-safe manner.
   * Don't call these unless you know what you're doing: race conditions are no fun.
   * @{
   */

  uint32_t subTaskHandleAddAtomic(TaskHandle_t handle);
  void subTaskRemoveHandleAtomic(uint32_t index);
  uint32_t subTaskReadCountAtomic() const;
  void subTaskAllowTaskCreation(bool allowSubTaskCreation);
  void subTaskNotifyFinish() const;
  void subTasksRequestCancellation() const;
  void subTasksClear();

  /** @} */  // end of TextContextSubTaskAPI

  /**
   * @defgroup TaskContextOperationModeSwitcherAPI Operation Mode switcher API
   * @brief Methods to manage the operation mode of TheTranslation™
   * @{
   */

  TaskHandle_t *getTaskSwitcherTaskHandle() { return &m_modeSwitcherTaskHandle; }

  void waitForModeOperationModeChange() const;

  /// @brief Notifies the mode switcher to switch to the requested operation mode
  /// @details This function "wakes" the mode switcher task, so the request may not be processed immediately. Note that this function will
  /// (silently) fail if a mode change request is already in progress.
  /// @param newMode The new operation mode to switch to.
  void requestOperationModeChange(OperationMode newMode);

  constexpr OperationMode getCurrentOperationMode() const { return m_currentMode; }

  /// @brief Sets the current operation mode to the specified value.
  /// @details THIS IS NOT THREAD-SAFE! This function should only be called from the mode switcher task.
  void setOperationMode(OperationMode newMode) { m_currentMode = newMode; }

  /// @brief Retrieves the operation mode requested by the user.
  /// @details The requested is set by a call TaskContext::requestOperationModeChange.
  /// @return The requested operation mode, or OperationMode::UNDEFINED if no mode change has been requested yet.
  constexpr OperationMode getRequestedOperationMode() const { return m_requestedMode; }

  /** @} */  // end of TaskContextOperationModeSwitcherAPI

 private:
  Hardware *m_hardware;

  // Sub-task management internal state
  bool m_allowSubTaskCreation;
  uint32_t m_subTaskCount;
  uint32_t m_nextTaskIndex;
  TaskHandle_t m_subTaskHandles[MAX_SUB_TASKS];

  // Mode change internal state
  TaskHandle_t m_modeSwitcherTaskHandle;
  StaticSemaphore_t m_switchModeSemaphoreBuffer;
  SemaphoreHandle_t m_switchModeSemaphore;
  OperationMode m_currentMode;
  OperationMode m_requestedMode;
};

/// @brief The type of notification sent from the mode switcher to a sub-task to request cancellation.
/// @see TaskContext::subTaskRequestCancellation
constexpr uint32_t REQUEST_SUB_TASK_CANCELLATION_BIT = 1;

#endif  // !defined(TASK_CONTEXT_HPP)