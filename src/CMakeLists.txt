set(SOURCES
        Buttons.cpp
        configuration.cpp
        Conveyor.cpp
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
)


idf_component_register(SRCS ${SOURCES}
        INCLUDE_DIRS . ../include
        REQUIRES Simulation)
target_compile_options(${COMPONENT_LIB} PRIVATE -std=gnu++11)
add_definitions(-DENV_SIMULATION -D ENV_M5STACK -D HARDWARE_GRBL -D HARDWARE_MFRC522_I2C -D HARDWARE_GOPLUS2)