set(SOURCES
        Buttons.cpp
        configuration.cpp
        Conveyor.cpp
        esp_main.cpp
        Hardware.cpp
        lcdScreen.cpp
        main.cpp
        maintenance.cpp
        production.cpp
        Sorter.cpp
        TaskContext.cpp
        TagReader.cpp
        taskUtil.cpp
        WebConfigurator.cpp
        simulation/Arduino.cpp
        simulation/Button.cpp
        simulation/GoPlus2.cpp
        simulation/HardwareSerial.cpp
        simulation/M5Display.cpp
        simulation/M5Power.cpp
        simulation/M5Stack.cpp
        simulation/NonBlockingGRBL.cpp
        simulation/MFRC522_I2C.cpp
        simulation/Print.cpp
        simulation/SimulationServer.cpp
        simulation/WebConfig.cpp
        simulation/WebServer.cpp
        simulation/Wire.cpp
)


idf_component_register(SRCS ${SOURCES}
        INCLUDE_DIRS . ../include ../include/simulation ../include/utility
        REQUIRES esp_http_client nvs_flash)
target_compile_options(${COMPONENT_LIB} PRIVATE -std=gnu++11)
add_definitions(-DENV_SIMULATION -D ENV_M5STACK -D HARDWARE_GRBL -D HARDWARE_MFRC522_I2C -D HARDWARE_GOPLUS2)