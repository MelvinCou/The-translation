set(SOURCES
    src/Arduino.cpp
    src/Button.cpp
    src/GoPlus2.cpp
    src/HardwareSerial.cpp
    src/HCSR04.cpp
    src/HTTPClient.cpp
    src/M5Display.cpp
    src/M5Power.cpp
    src/M5Stack.cpp
    src/NonBlockingGRBL.cpp
    src/MFRC522_I2C.cpp
    src/Print.cpp
    src/simulation.cpp 
    src/SimulationServer.cpp
    src/watchdog.cpp
    src/WebConfig.cpp
    src/WebServer.cpp
    src/WiFi.cpp
    src/Wire.cpp
)


idf_component_register(SRCS ${SOURCES}
        INCLUDE_DIRS src include include/simulation include/utility
)
target_compile_options(${COMPONENT_LIB} PRIVATE -std=gnu++11)
