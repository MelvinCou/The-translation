#ifndef THE_TRANSLATION_CONFIG_HPP
#define THE_TRANSLATION_CONFIG_HPP

#pragma region "task scheduler configuration"
// #define _TASK_TIMECRITICAL       // Enable monitoring scheduling overruns
// #define _TASK_SLEEP_ON_IDLE_RUN // Enable 1 ms SLEEP_IDLE powerdowns between runs if no callback methods were invoked during the pass
#define _TASK_STATUS_REQUEST // Compile with support for StatusRequest functionality - triggering tasks on status change events in addition to time only
// #define _TASK_WDT_IDS            // Compile with support for wdt control points and task ids
// #define _TASK_LTS_POINTER        // Compile with support for local task storage pointer
// #define _TASK_PRIORITY           // Support for layered scheduling priority
// #define _TASK_MICRO_RES          // Support for microsecond resolution
// #define _TASK_STD_FUNCTION       // Support for std::function (ESP8266 ONLY)
// #define _TASK_DEBUG              // Make all methods and variables public for debug purposes
// #define _TASK_INLINE             // Make all methods "inline" - needed to support some multi-tab, multi-file implementations
// #define _TASK_TIMEOUT            // Support for overall task timeout
// #define _TASK_OO_CALLBACKS       // Support for callbacks via inheritance
// #define _TASK_EXPOSE_CHAIN       // Methods to access tasks in the task chain
// #define _TASK_SCHEDULING_OPTIONS // Support for multiple scheduling options
// #define _TASK_DEFINE_MILLIS      // Force forward declaration of millis() and micros() "C" style
// #define _TASK_EXTERNAL_TIME      // Custom millis() and micros() methods
// #define _TASK_THREAD_SAFE        // Enable additional checking for thread safety
// #define _TASK_SELF_DESTRUCT      // Enable tasks to "self-destruct" after disable
#pragma endregion "task scheduler configuration"

#pragma region "conveyor configuration"
#define CONVEYOR_GRBL_I2C_ADDR 0x70
#define CONVEYOR_MOTOR_SPEED "700"
#define CONVEYOR_MOTOR_DISTANCE "999999"
#define CONVEYOR_UPDATE_INTERVAL 100 //< Update interval in milliseconds

#define CONVEYOR_SIMULATED_DELAY_UPDATES 10 //< Simulated amount of updates for the motor to start or stop
#define CONVEYOR_DESIRED_STATUS_PIN 14      //< Leave it as -1 to disable the pin
#define CONVEYOR_CURRENT_STATUS_PIN 12      //< Leave it as -1 to disable the pin
#pragma endregion "conveyor configuration"

#pragma region "M5 buttons configuration"
#define BUTTONS_READ_INTERVAL 10 //< Read interval in milliseconds

#define SIMPLE_BUTTONS_DEBOUNCE_MS 250
#define SIMPLE_BUTTON_A_PIN 16
#define SIMPLE_BUTTON_B_PIN 2
#define SIMPLE_BUTTON_C_PIN 15
#pragma endregion "M5 buttons configuration"

#endif // !defined(THE_TRANSLATION_CONFIG_HPP)
