#include "taskUtil.hpp"

#include <Arduino.h>
#include <freertos/task.h>

#include "Logger.hpp"
#include "TaskContext.hpp"

struct WrappedSubTask {
  SimpleSubTask subTask;
  TaskContext *ctx;
#if LOG_LEVEL >= LOG_LEVEL_DEBUG
  char const *taskName;
#endif
};

[[noreturn]] static void subTaskWrapper(WrappedSubTask const *wrappedSubTask) {
  // Extract the sub-task and hardware instance from the wrapped struct.
  SimpleSubTask subTask = wrappedSubTask->subTask;
  TaskContext *ctx = wrappedSubTask->ctx;
#if LOG_LEVEL >= LOG_LEVEL_DEBUG
  char const *taskName = wrappedSubTask->taskName;
#endif
  delete wrappedSubTask;

  LOG_DEBUG("[TASK] Start sub-task %s (H=%p)\n", taskName, xTaskGetCurrentTaskHandle());

  // register this task as a sub-task
  uint32_t subTaskIndex = ctx->subTaskHandleAddAtomic(xTaskGetCurrentTaskHandle());

  // user-defined code

  LOG_TRACE("[TASK] Start of user code for sub-task %s (H=%p)\n", taskName, xTaskGetCurrentTaskHandle());
  subTask(ctx);
  LOG_TRACE("[TASK] End of user code for sub-task %s (H=%p)\n", taskName, xTaskGetCurrentTaskHandle());

  // remove task from the list of sub-tasks
  ctx->subTaskRemoveHandleAtomic(subTaskIndex);

  // once the task is remove, notify the mode switcher task
  ctx->subTaskNotifyFinish();

  LOG_DEBUG("[TASK] End of sub-task %s (H=%p)\n", taskName, xTaskGetCurrentTaskHandle());

  // Marks the current task for deletion.
  vTaskDelete(nullptr);
  for (;;) {
    // This should never be reached. FreeRTOS will have already deleted the task.
  }
}

const TaskFunction_t subTaskWrapperTask = reinterpret_cast<TaskFunction_t>(&subTaskWrapper);

void spawnSubTaskInternal(SimpleSubTask subTask, TaskContext *ctx, const char *taskName) {
  // FreeRTOS tasks only accept void* as the parameter, so we need to wrap the sub-task and context instance in a struct.
#if LOG_LEVEL >= LOG_LEVEL_DEBUG
  auto wrapped = new WrappedSubTask{subTask, ctx, taskName};
#else
  auto wrapped = new WrappedSubTask{subTask, ctx};
#endif

  xTaskCreate(subTaskWrapperTask, taskName, 4096, wrapped, 8, nullptr);
}

bool interruptibleTaskPause(TickType_t delay) {
  uint32_t notification;
  bool hasNotification = xTaskNotifyWait(0, 0, &notification, delay) == pdTRUE;
  if (hasNotification) {
    // For some unknowable reason, the notification is *still* cleared even if I EXPLICITLY tell it not to.
    // The official docs and even to the FreeRTOS source code says that the notification should be cleared!
    // I lost an entire day pulling my hair out over this, I give up.
    xTaskNotify(xTaskGetCurrentTaskHandle(), notification, eSetBits);
  }

  bool shouldStop = hasNotification && notification & REQUEST_SUB_TASK_CANCELLATION_BIT;
  return !shouldStop;
}
