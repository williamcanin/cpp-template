function(set_project_warnings target)
    if (CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
        target_compile_options(${target} PRIVATE
            -Wall -Wextra -Wpedantic -Wconversion
            -Wshadow -Wformat=2 -Wnull-dereference
            -Wold-style-cast -Woverloaded-virtual
            -Wnon-virtual-dtor -Wdouble-promotion
        )
    endif()

    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        target_compile_options(${target} PRIVATE -fsanitize=address,undefined)
        target_link_options(${target} PRIVATE -fsanitize=address,undefined)
    endif()
endfunction()
