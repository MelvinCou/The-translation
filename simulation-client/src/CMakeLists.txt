add_executable(simulation-client main.cpp SimulationClient.cpp)
target_include_directories(simulation-client PRIVATE .)

target_link_libraries(simulation-client -lraylib)