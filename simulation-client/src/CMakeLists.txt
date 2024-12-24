set(SOURCES
        HttpProxy.cpp
        main.cpp
        SimulationClient.cpp
        ../imgui/imgui.cpp
        ../imgui/imgui_demo.cpp
        ../imgui/imgui_draw.cpp
        ../imgui/imgui_tables.cpp
        ../imgui/imgui_widgets.cpp
        ../rlImGui/rlImGui.cpp
)

add_executable(simulation-client ${SOURCES})
target_include_directories(simulation-client PRIVATE . ../imgui ../rlImGui)

target_link_libraries(simulation-client -lraylib)
