## Set minimum required CMake version
cmake_minimum_required(VERSION 3.20...3.30)

## Set compiler toolchain
if(WIN32)
    include("${CMAKE_SOURCE_DIR}/toolchains/windows.cmake")
elseif(UNIX)
    include("${CMAKE_SOURCE_DIR}/toolchains/linux.cmake")
endif()

## Define the project
project(raylib-c
    VERSION 0.1.0
    DESCRIPTION "A cool project with raylib"
    LANGUAGES C
)
message("${PROJECT_NAME} version: ${CMAKE_PROJECT_VERSION}")

## Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

## Set default build type
# NOTE: This is done before fetching raylib, and uses FORCE to
# ensure that it is set and that, ideally, it will be detected
# by raylib.
if(NOT CMAKE_BUILD_TYPE)
    message(STATUS "Setting default build type to 'Debug'")
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Build type" FORCE)
endif()

## Provide Options
option(SNIPPET "Enable compiling 'snippets' (-Wno-unused-function)" ON)
message(STATUS "Compile Snippets: ${SNIPPET}")

## Manage dependencies
include(FetchContent)

# Configure raylib build options
set(BUILD_SHARED_LIBS ON CACHE BOOL "Build raylib as a shared library")
set(PLATFORM "Desktop" CACHE STRING "Build for the target platform")
set(USE_EXTERNAL_GLFW OFF CACHE BOOL "Use external GLFW library")
set(GLFW_BUILD_WAYLAND ON CACHE BOOL "Build internal glfw with Wayland support")
set(GLFW_BUILD_X11 ON CACHE BOOL "Build internal glfw with X11 support")

# Fetch raylib
set(RAYLIB_VERSION 5.5)
FetchContent_Declare(
    raylib
    DOWNLOAD_EXTRACT_TIMESTAMP OFF
    URL https://github.com/raysan5/raylib/archive/refs/tags/${RAYLIB_VERSION}.tar.gz
    FIND_PACKAGE_ARGS
)
FetchContent_MakeAvailable(raylib)

# Fetch raygui
# set(RAYGUI_VERSION 4.0)
# FetchContent_Declare(
#     raygui
#     DOWNLOAD_EXTRACT_TIMESTAMP OFF
#     URL https://github.com/raysan5/raygui/archive/refs/tags/${RAYGUI_VERSION}.tar.gz
#     FIND_PACKAGE_ARGS
# )
# FetchContent_MakeAvailable(raygui)

## Our Project
add_executable(${PROJECT_NAME})
add_subdirectory(src)

set_target_properties(
    ${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}
)

set_property(
    TARGET ${PROJECT_NAME}
    PROPERTY VS_DEBUGGER_WORKING_DIRECTORY $<TARGET_FILE_DIR:${PROJECT_NAME}>
)

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_SOURCE_DIR}/src/resources $<TARGET_FILE_DIR:${PROJECT_NAME}>/resources
)

# Set initial compiler flags
target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wno-unused-parameter)

# Allow compiling with unused functions
if(SNIPPET)
    target_compile_options(${PROJECT_NAME} PRIVATE -Wno-unused-function)
endif()

# Add additional flags based on build type
if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    # Generates debug information specifically for gdb
    target_compile_options(${PROJECT_NAME} PRIVATE -ggdb)
endif()

# Add include path(s)
# NOTE: Since raygui is a header-only library, CMake does not automatically include the include path for it.
# It is provided here manually.
# set(RAYGUI_INCLUDE_PATH "${CMAKE_BINARY_DIR}/_deps/raygui-src/src")
# target_include_directories(${PROJECT_NAME} PRIVATE ${RAYGUI_INCLUDE_PATH})

## Link libraries
target_link_libraries(${PROJECT_NAME} raylib)

# Checks if OSX and links appropriate frameworks (Only required on MacOS)
if(APPLE)
    target_link_libraries(${PROJECT_NAME} "-framework IOKit")
    target_link_libraries(${PROJECT_NAME} "-framework Cocoa")
    target_link_libraries(${PROJECT_NAME} "-framework OpenGL")
endif()
