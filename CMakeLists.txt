cmake_minimum_required(VERSION 3.25)
project(app LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/CompilerWarnings.cmake)

find_package(fmt CONFIG REQUIRED)
find_package(Catch2 CONFIG REQUIRED)
find_package(unofficial-sodium CONFIG REQUIRED)
find_package(CLI11 CONFIG REQUIRED)

add_subdirectory(lib/app-core) # Library internal

add_executable(${PROJECT_NAME} src/main.cpp)

target_link_libraries(${PROJECT_NAME}
  PRIVATE 
    app-core
    fmt::fmt # Modern prints
    unofficial-sodium::sodium # Criptography
    Catch2::Catch2WithMain # Tests
    CLI11::CLI11  # CLI
)

set_project_warnings(${PROJECT_NAME})

enable_testing()
add_subdirectory(tests)
