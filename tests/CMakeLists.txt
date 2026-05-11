find_package(fmt CONFIG REQUIRED)
find_package(Catch2 CONFIG REQUIRED)
find_package(unofficial-sodium CONFIG REQUIRED)
find_package(CLI11 CONFIG REQUIRED)

add_executable(tests test_main.cpp)
target_link_libraries(tests 
  PRIVATE
  	app-core
    fmt::fmt
    unofficial-sodium::sodium
    CLI11::CLI11
   	Catch2::Catch2WithMain
)

add_test(NAME tests COMMAND tests)
