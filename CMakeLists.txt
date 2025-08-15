cmake_minimum_required(VERSION 3.15...3.30)

#-------------------------------------------------------------------------------

# Setup the compiler toolchain per platform
if(WIN32)
    include("${CMAKE_SOURCE_DIR}/cmake/windows.cmake")
elseif(APPLE)
    include("${CMAKE_SOURCE_DIR}/cmake/macos.cmake")
elseif(LINUX)
    include("${CMAKE_SOURCE_DIR}/cmake/linux.cmake")
endif()

#-------------------------------------------------------------------------------

# Define the project
project(
    raylib-template
    VERSION 0.1.0
    DESCRIPTION "A cool project with raylib"
    LANGUAGES C CXX
)

message("${PROJECT_NAME} version ${CMAKE_PROJECT_VERSION}")

#-------------------------------------------------------------------------------

# Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Set default build type
# NOTE: This is done before fetching raylib, and uses FORCE to
# ensure that it is set and that, ideally, it will be detected
# by raylib.
if(NOT CMAKE_BUILD_TYPE)
    message(STATUS "Setting default build type to 'Debug'")
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Build type" FORCE)
endif()

#-------------------------------------------------------------------------------

# Variables for common directories.
set(BASE_RUNTIME_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_BUILD_TYPE}")

#-------------------------------------------------------------------------------

include(FetchContent)

# Pre-configure the build options for raylib before its inclusion. When done
# this way, raylib's CMake script will detect and use their values.
set(BUILD_SHARED_LIBS ON CACHE BOOL "Build raylib as a shared library")
set(PLATFORM "Desktop" CACHE STRING "Build for the target platform")
set(USE_EXTERNAL_GLFW OFF CACHE BOOL "Use external GLFW library")

# These only need to be set if building for Linux.
if(LINUX)
    set(GLFW_BUILD_WAYLAND ON CACHE BOOL "Build internal glfw with Wayland support")
    set(GLFW_BUILD_X11 ON CACHE BOOL "Build internal glfw with X11 support")
endif()

# Set dependency versions
set(RAYLIB_VERSION 5.5)

# Fetch raylib
FetchContent_Declare(
    raylib
    FETCHCONTENT_QUIET FALSE
    DOWNLOAD_EXTRACT_TIMESTAMP OFF
    URL https://github.com/raysan5/raylib/archive/refs/tags/${RAYLIB_VERSION}.tar.gz
    FIND_PACKAGE_ARGS
)
FetchContent_MakeAvailable(raylib)

#-------------------------------------------------------------------------------

# Add the 'src' subdirectory which contains the script for building the actual
# project.
#
# It is set up this way for projects with multiple "sub projects". This allows
# you to add things like tools or self-made libraries as separate builds.
add_subdirectory(src)
