#include <TaskContext.hpp>

#include "Hardware.hpp"
#include "Logger.hpp"
#include "OperationMode.hpp"
#include "production/ProductionValues.hpp"

void startProductionMode(TaskContext *ctx);
void startMaintenanceMode(TaskContext *ctx);
void startConfigurationMode(TaskContext *ctx);

[[noreturn]] void handleModeSwitching(TaskContext *ctx) {
  for (;;) {
    // Wait for a call to requestOperationModeChange()
    ctx->waitForModeOperationModeChange();
    OperationMode newMode = ctx->getRequestedOperationMode();

    if (newMode == OperationMode::UNDEFINED) {
      LOG_ERROR("[MODE] Received invalid mode change request\n");
      continue;
    }
    if (newMode == ctx->getCurrentOperationMode()) {
      LOG_DEBUG("[MODE] Ignoring mode change request to %s, already in that mode\n", OPERATION_MODES[static_cast<uint32_t>(newMode)]);
      continue;
    }

    LOG_INFO("[MODE] Switching to mode %s\n", OPERATION_MODES[static_cast<uint32_t>(newMode)]);

    ctx->subTaskAllowTaskCreation(false);
    ctx->subTasksRequestCancellation();

    // Wait for all sub-tasks to gracefully finish
    while (ctx->subTaskReadCountAtomic() > 0) {
      ulTaskNotifyTake(pdFALSE, 1000 / portTICK_PERIOD_MS);
      // try again in 1 second, if somehow the sub-tasks are still running
    }

    ctx->setOperationMode(newMode);
    ctx->subTasksClear();
    ctx->subTaskAllowTaskCreation(true);

    switch (newMode) {
      case OperationMode::PRODUCTION: {
        auto values = ctx->getSharedValues<ProductionValues>();
        if (values != nullptr) {
          delete values;
        }
        break;
      }
      default:
        break;
    }

    switch (newMode) {
      case OperationMode::PRODUCTION:
        startProductionMode(ctx);
        break;
      case OperationMode::MAINTENANCE:
        startMaintenanceMode(ctx);
        break;
      case OperationMode::CONFIGURATION:
        startConfigurationMode(ctx);
        break;
      default:
        LOG_ERROR("[MODE] Invalid mode %u\n", static_cast<uint32_t>(newMode));
        break;
    }

    LOG_DEBUG("[MODE] Finished switching to mode %s\n", OPERATION_MODES[static_cast<uint32_t>(newMode)]);
  }
}

const TaskFunction_t handleModeSwitchingTask = reinterpret_cast<TaskFunction_t>(&handleModeSwitching);

void setup() {
  auto hardware = new Hardware();
  auto ctx = new TaskContext(hardware);

  hardware->begin();
  ctx->requestOperationModeChange(OperationMode::PRODUCTION);
  xTaskCreate(handleModeSwitchingTask, "handleModeSwitching", 2048, ctx, 10, ctx->getTaskSwitcherTaskHandle());
}

void loop() {
  // nothing to do!
}
