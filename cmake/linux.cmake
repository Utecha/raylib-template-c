# Platform Name
set(CMAKE_SYSTEM_NAME Linux)
message(STATUS "Using Linux toolchain")

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
    find_program(GCC gcc)
    find_program(GPP g++)

    if(GCC OR GPP)
        message(STATUS "Compiling using gcc")
        set(CMAKE_C_COMPILER ${GCC} CACHE STRING "C Compiler")
        set(CMAKE_CXX_COMPILER ${GPP} CACHE STRING "C++ Compiler")
    else()
        message(STATUS "Compiling using the system default compiler (cc/c++)")
    endif()
endif()
