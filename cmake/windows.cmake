# Platform Name
set(CMAKE_SYSTEM_NAME Windows)
message(STATUS "Using Windows toolchain")

# C Standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 11)
message(STATUS "C Standard: ${CMAKE_C_STANDARD}")
message(STATUS "C++ Standard: ${CMAKE_CXX_STANDARD}")

# C Extensions
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_EXTENSIONS OFF)
message(STATUS "C Extensions: ${CMAKE_C_EXTENSIONS}")
message(STATUS "C++ Extensions: ${CMAKE_CXX_EXTENSIONS}")

# Find appropriate compilers
find_program(CLANG clang)
find_program(CLANGPP clang++)

if(CLANG OR CLANGPP)
    message(STATUS "Compiling using clang")
    set(CMAKE_C_COMPILER ${CLANG} CACHE STRING "C Compiler")
    set(CMAKE_CXX_COMPILER ${CLANGPP} CACHE STRING "C++ Compiler")
else()
    find_program(MSVC)

    if(MSVC)
        message(STATUS "Compiling using MSVC")
        set(CMAKE_C_COMPILER ${MSVC} CACHE STRING "C Compiler")
        set(CMAKE_CXX_COMPILER ${MSVC} CACHE STRING "C++ Compiler")
    else()
        message(FATAL_ERROR "Could not find the MSVC compiler. Double check that it's installed.")
    endif()
endif()

