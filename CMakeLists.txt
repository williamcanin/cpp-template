cmake_minimum_required(VERSION 3.25)
project(appname LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/CompilerWarnings.cmake)

find_package(fmt CONFIG REQUIRED)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt)

set_project_warnings(${PROJECT_NAME})

enable_testing()
add_subdirectory(tests)
