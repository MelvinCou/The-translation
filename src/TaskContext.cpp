#include "TaskContext.hpp"

#include <Arduino.h>

#include "Logger.hpp"

static portMUX_TYPE subTaskCountSpinLock = portMUX_INITIALIZER_UNLOCKED;

TaskContext::TaskContext(Hardware* hardware)
    : m_hardware(hardware),
      m_allowSubTaskCreation(true),
      m_subTaskCount(0),
      m_nextTaskIndex(0),
      m_subTaskHandles{},
      m_modeSwitcherTaskHandle(nullptr),
      m_switchModeSemaphoreBuffer{},
      m_switchModeSemaphore(xSemaphoreCreateBinaryStatic(&m_switchModeSemaphoreBuffer)),
      m_currentMode(OperationMode::UNDEFINED),
      m_requestedMode(OperationMode::UNDEFINED) {
  for (uint32_t i = 0; i < MAX_SUB_TASKS; i++) {
    m_subTaskHandles[i] = nullptr;
  }
}

uint32_t TaskContext::subTaskHandleAddAtomic(TaskHandle_t handle) {
  taskENTER_CRITICAL(&subTaskCountSpinLock);

  if (!m_allowSubTaskCreation || m_subTaskCount >= MAX_SUB_TASKS) {
    taskEXIT_CRITICAL(&subTaskCountSpinLock);
    LOG_ERROR("Cannot add sub-task handle, limit reached\n");
    return MAX_SUB_TASKS;
  }

  uint32_t subTaskIndex = m_nextTaskIndex;
  m_subTaskHandles[subTaskIndex] = handle;
  m_nextTaskIndex++;
  m_subTaskCount++;
  taskEXIT_CRITICAL(&subTaskCountSpinLock);
  return subTaskIndex;
}

void TaskContext::subTaskRemoveHandleAtomic(uint32_t index) {
  taskENTER_CRITICAL(&subTaskCountSpinLock);
  m_subTaskHandles[index] = nullptr;
  m_subTaskCount--;
  taskEXIT_CRITICAL(&subTaskCountSpinLock);
}

uint32_t TaskContext::subTaskReadCountAtomic() const {
  taskENTER_CRITICAL(&subTaskCountSpinLock);
  uint32_t count = m_subTaskCount;
  taskEXIT_CRITICAL(&subTaskCountSpinLock);
  return count;
}

void TaskContext::subTaskAllowTaskCreation(bool allowSubTaskCreation) {
  taskENTER_CRITICAL(&subTaskCountSpinLock);
  m_allowSubTaskCreation = allowSubTaskCreation;
  taskEXIT_CRITICAL(&subTaskCountSpinLock);
}

void TaskContext::subTaskNotifyFinish() const { xTaskNotify(m_modeSwitcherTaskHandle, 0, eIncrement); }

void TaskContext::subTasksRequestCancellation() const {
  for (uint32_t i = 0; i < MAX_SUB_TASKS; i++) {
    if (m_subTaskHandles[i] != nullptr) {
      xTaskNotify(m_subTaskHandles[i], REQUEST_SUB_TASK_CANCELLATION_BIT, eSetBits);
    }
  }
}

void TaskContext::subTasksClear() {
  for (uint32_t i = 0; i < MAX_SUB_TASKS; i++) {
    m_subTaskHandles[i] = nullptr;
  }
  m_subTaskCount = 0;
  m_nextTaskIndex = 0;
}

void TaskContext::waitForModeOperationModeChange() const {
  LOG_TRACE("Waiting for mode change request\n");
  xSemaphoreTake(m_switchModeSemaphore, portMAX_DELAY);
}

void TaskContext::requestOperationModeChange(OperationMode newMode) {
  LOG_DEBUG("Requesting mode change to %s\n", OPERATION_MODES[static_cast<uint32_t>(newMode)]);

  m_requestedMode = newMode;
  OperationMode prevMode = m_currentMode;
  xSemaphoreGive(m_switchModeSemaphore);

  LOG_DEBUG("Requested mode change to %s, previous mode was %s\n", OPERATION_MODES[static_cast<uint32_t>(newMode)],
            OPERATION_MODES[static_cast<uint32_t>(prevMode)]);
}
