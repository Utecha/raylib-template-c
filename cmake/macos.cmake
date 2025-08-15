# Platform Name
set(CMAKE_SYSTEM_NAME Apple)
message(STATUS "Using Apple toolchain")

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

# On MacOS, if the user does not have clang installed already, this
# will fail and they will be prompted to install it. As a result, this
# is theoretically safe to just set outright.
set(CMAKE_C_COMPILER clang CACHE STRING "C Compiler")
set(CMAKE_CXX_COMPILER clang++ CACHE STRING "C++ Compiler")
