#include "taskUtil.hpp"

#include <freertos/task.h>

#include "OperationMode.hpp"
#include "TaskContext.hpp"

struct WrappedSubTask {
  SimpleSubTask subTask;
  TaskContext *ctx;
};

[[noreturn]] static void subTaskWrapper(WrappedSubTask const *wrappedSubTask) {
  // Extract the sub-task and hardware instance from the wrapped struct.
  SimpleSubTask subTask = wrappedSubTask->subTask;
  TaskContext *ctx = wrappedSubTask->ctx;
  delete wrappedSubTask;

  // register this task as a sub-task
  uint32_t subTaskIndex = ctx->subTaskHandleAddAtomic(xTaskGetCurrentTaskHandle());

  // user-defined code
  subTask(ctx);

  // remove task from the list of sub-tasks
  ctx->subTaskRemoveHandleAtomic(subTaskIndex);

  // once the task is remove, notify the mode switcher task
  ctx->subTaskNotifyFinish();

  // Marks the current task for deletion.
  vTaskDelete(nullptr);
  for (;;) {
    // This should never be reached. FreeRTOS will have already deleted the task.
  }
}

const TaskFunction_t subTaskWrapperTask = reinterpret_cast<TaskFunction_t>(&subTaskWrapper);

void spawnSubTaskInternal(SimpleSubTask subTask, TaskContext *ctx, const char *taskName) {
  // FreeRTOS tasks only accept void* as the parameter, so we need to wrap the sub-task and context instance in a struct.
  auto wrapped = new WrappedSubTask{subTask, ctx};
  xTaskCreate(subTaskWrapperTask, taskName, 4096, wrapped, 8, nullptr);
}

bool interruptibleTaskPause(TickType_t delay) {
  uint32_t notification;
  bool hasNotification = xTaskNotifyWait(0, REQUEST_SUB_TASK_CANCELLATION_BIT, &notification, delay) == pdTRUE;

  bool shouldStop = hasNotification && notification & REQUEST_SUB_TASK_CANCELLATION_BIT;
  return !shouldStop;
}
