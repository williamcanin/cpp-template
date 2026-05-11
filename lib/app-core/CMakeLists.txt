add_library(app-core app-core.cpp)

target_include_directories(app-core
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
)