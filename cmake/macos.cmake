# Platform Name
set(CMAKE_SYSTEM_NAME Apple)
message(STATUS "Using Mac-OS toolchain")

# C Standard
set(CMAKE_C_STANDARD 99)
message(STATUS "C Standard: ${CMAKE_C_STANDARD}")

# C Extensions
set(CMAKE_C_EXTENSIONS OFF)
message(STATUS "C Extensions: ${CMAKE_C_EXTENSIONS}")

# Find appropriate compilers
# This *attempts* to default to clang, but falls back to either gcc
# or the default cc, if necessary.
find_program(CLANG clang)

if(CLANG)
    message(STATUS "Compiling using clang")
    set(CMAKE_C_COMPILER ${CLANG} CACHE STRING "C Compiler")
else()
    message(STATUS "Compiling using the system default compiler (cc)")
endif()
