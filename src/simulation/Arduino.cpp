#include "simulation/Arduino.hpp"

#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

unsigned long micros() { return xTaskGetTickCount() * portTICK_RATE_MICROSECONDS; }
unsigned long millis() { return xTaskGetTickCount() * portTICK_PERIOD_MS; }
void delay(uint32_t millis) { vTaskDelay(millis / portTICK_PERIOD_MS); }
void delayMicroseconds(uint32_t us) { vTaskDelay(us / portTICK_RATE_MICROSECONDS); }
