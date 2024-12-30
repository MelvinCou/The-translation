set(SOURCES
        gui.cpp
        main.cpp
        ../../lib/SimControl/src/Client.cpp
        ../../lib/SimControl/src/ClientThread.cpp
        ../../lib/SimControl/src/Configuration.cpp
        ../../lib/SimControl/src/Controller.cpp
        ../../lib/SimControl/src/ControllerThread.cpp
        ../../lib/SimControl/src/HttpProxy.cpp
        ../imgui/imgui.cpp
        ../imgui/imgui_demo.cpp
        ../imgui/imgui_draw.cpp
        ../imgui/imgui_tables.cpp
        ../imgui/imgui_widgets.cpp
        ../rlImGui/rlImGui.cpp
)

add_executable(simulation-client ${SOURCES})
target_include_directories(simulation-client PRIVATE . ../../lib/SimControl/include ../imgui ../rlImGui)

target_link_libraries(simulation-client -lraylib)
