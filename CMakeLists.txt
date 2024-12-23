cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD 11)
set(EXTRA_COMPONENT_DIRS src lib/Simulation)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
project(idf-test)

idf_build_set_property(COMPILE_OPTIONS "-Wno-format" APPEND)
idf_build_set_property(COMPILE_OPTIONS "-Wno-format-security" APPEND)
