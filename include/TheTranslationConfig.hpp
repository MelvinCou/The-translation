#ifndef THE_TRANSLATION_CONFIG_HPP
#define THE_TRANSLATION_CONFIG_HPP

#pragma region "conveyor configuration"
#define CONVEYOR_GRBL_I2C_ADDR 0x70
#define CONVEYOR_MOTOR_SPEED "350"
#define CONVEYOR_MOTOR_DISTANCE "999"
#define CONVEYOR_UPDATE_INTERVAL 100  //< Update interval in milliseconds

#define CONVEYOR_SIMULATED_DELAY_UPDATES 10  //< Simulated amount of updates for the motor to start or stop
#define CONVEYOR_DESIRED_STATUS_PIN 14       //< Leave it as -1 to disable the pin
#define CONVEYOR_CURRENT_STATUS_PIN 12       //< Leave it as -1 to disable the pin
#pragma endregion "conveyor configuration"

#pragma region "sorter configuration"
#define SORTER_SERVO_NUMBER 0
#define SORTER_SERVO_PULSE_WIDTH 1500
#define SORTER_SERVO_LEFT_ANGLE 53
#define SORTER_SERVO_MIDDLE_ANGLE 30
#define SORTER_SERVO_RIGHT_ANGLE 20

#define SORTER_DIRECTION_LEFT_PIN 32    //< Leave it as -1 to disable the pin
#define SORTER_DIRECTION_MIDDLE_PIN 33  //< Leave it as -1 to disable the pin
#define SORTER_DIRECTION_RIGHT_PIN 25   //< Leave it as -1 to disable the pin
#pragma endregion "sorter configuration"

#pragma region "M5 buttons configuration"
#define BUTTONS_READ_INTERVAL 10  //< Read interval in milliseconds

#define SIMPLE_BUTTONS_DEBOUNCE_MS 250
// Note: not all GPIO pins support pull-up resistors, so it is important to check the datasheet for the specific ESP32 module being used.
#define SIMPLE_BUTTON_A_PIN 23
#define SIMPLE_BUTTON_B_PIN 2
#define SIMPLE_BUTTON_C_PIN 15
#pragma endregion "M5 buttons configuration"

#pragma region "M5 LCD screen configuration"
#define SCREEN_FONT_SIZE 2
#pragma endregion "M5 LCD screen configuration"

#pragma region "tag reader configuration"
#define TAG_READER_INTERVAL 100  //< Read interval in milliseconds
#pragma endregion "tag reader configuration"

#pragma region "soft access point configuration"
#define SOFTAP_SSID "The Translation"
#define SOFTAP_PASSWORD "Rotation Is Best!"
#pragma endregion "soft access point configuration"

#pragma region "dolibarr configuration"
#define DOLIBARR_HEADER_APIKEY "DOLAPIKEY"
#define DOLIBARR_ENDPOINT_STATUS "/status"
#define DOLIBARR_ENDPOINT_PRODUCTS "/products?limit=1&mode=1&sqlfilters=(t.barcode%3A%3D%3A'"
#define DOLIBARR_ENDPOINT_PRODUCTS_END "')"
#define DOLIBARR_ENDPOINT_STOCKMOVEMENTS "/stockmovements"
#pragma endregion "dolibarr configuration"

#endif  // !defined(THE_TRANSLATION_CONFIG_HPP)
