/**
 * @file taskUtil.hpp
 * @brief Contains utility functions for managing FreeRTOS tasks.
 */

#ifndef TASK_UTIL_HPP
#define TASK_UTIL_HPP

#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

// forward declaration
class TaskContext;

/// @brief Type definition for a simple sub-task function.
/// @see spawnSubTask
using SimpleSubTask = void (*)(TaskContext *);

/// @private
void spawnSubTaskInternal(SimpleSubTask subTask, TaskContext *ctx, char const *taskName);

/// @brief Spawns a sub-task for use within an operation mode.
/// @details Spawning tasks this way will automatically mark the task as a sub-task, meaning the mode switcher will wait for it to finish.
/// The FreeRTOS task will be created with a stack size of 4096 and a priority of 8, and will be deleted automatically when the function
/// returns.
/// @param subTask The sub-task function to run. @c SimpleSubTask type.
/// @param ctx The task context.
///
/// @code{cpp}
/// // Example usage:
/// void mySimpleTask(TaskContext *ctx) {
///     // do stuff...
/// }
///
/// spawnSubTask(mySimpleTask, ctx);
/// @endcode
#define spawnSubTask(subTask, ctx) spawnSubTaskInternal((subTask), (ctx), #subTask)

/// @brief Pauses the current task for a given delay.
/// @details The call this function will block the task unless the task is interrupted.
/// @param delay The delay in ticks.
/// @return true if the task is allowed to continue, false if cancellation is requested.
bool interruptibleTaskPause(TickType_t delay);

/// @brief Same as interruptibleTaskPause but the delay is in milliseconds.
/// @note This function is NOT reentrant, nested loops using this function will not work as expected.
/// @param delayMs The delay in milliseconds.
/// @return true if the task is allowed to continue, false if cancellation is requested.
inline bool interruptibleTaskPauseMs(uint32_t delayMs) { return interruptibleTaskPause(delayMs / portTICK_PERIOD_MS); }

#endif  // !defined(TASK_UTIL_HPP)
