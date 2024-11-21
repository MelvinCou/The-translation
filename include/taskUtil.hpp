/**
 * @file taskUtil.hpp
 * @brief Contains utility functions for managing FreeRTOS tasks.
 */

#ifndef TASK_UTIL_HPP
#define TASK_UTIL_HPP

#include <freertos/FreeRTOS.h>

#define MAIN_MODE_SWITCH_SIGNAL 0x1

/// @brief Pauses the current task for a given delay.
/// @details The call this function will block the task unless the task is interrupted.
/// @param delay The delay in ticks.
/// @return true if the task is allowed to continue, false if cancellation is requested.
bool interruptibleTaskPause(TickType_t delay);

/// @brief Same as interruptibleTaskPause but the delay is in milliseconds.
/// @param delayMs The delay in milliseconds.
/// @return true if the task is allowed to continue, false if cancellation is requested.
inline bool interruptibleTaskPauseMs(uint32_t delayMs) { return interruptibleTaskPause(delayMs / portTICK_PERIOD_MS); }

/// @brief Marks the current task for deletion.
/// @return nothing, this function never returns.
[[noreturn]] void exitCurrentTask();

#endif  // !defined(TASK_UTIL_HPP)
