# Add the source files for the project.
# NOTE: *Only* the source files. Do not add headers here.
# You can glob the source files. Adding them manually allows for incremental
# compilation.
set(SOURCES
    main.c
)

#-------------------------------------------------------------------------------

# Add the executable target.
add_executable(${PROJECT_NAME} ${SOURCES})

#-------------------------------------------------------------------------------

# Set's the `RUNTIME_OUTPUT_DIRECTORY` property for platform consistency. It is
# set to what the default is on Windows (i.e. build\Release).
set_target_properties(
    ${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${BASE_RUNTIME_OUTPUT_DIR}
    VS_DEBUGGER_WORKING_DIRECTORY $<TARGET_FILE_DIR:${PROJECT_NAME}
)

#-------------------------------------------------------------------------------

# Add necessary include directories here.
# target_include_directories(
#     ${PROJECT_NAME} PRIVATE
# )

# Adds additional compiler flags to the target. Uses generators to generate
# the flags based on the compiler.
target_compile_options(
    ${PROJECT_NAME} PRIVATE
    $<$<STREQUAL:${CMAKE_C_COMPILER},clang>:
        -Wall
        -Wextra
        $<$<STREQUAL:$<CONFIG>,Debug>:-ggdb>
    >
    $<$<STREQUAL:${CMAKE_C_COMPILER},gcc>:
        -Wall
        -Wextra
        $<$<STREQUAL:$<CONFIG>,Debug>:-ggdb>
    >
    $<$<STREQUAL:${CMAKE_C_COMPILER},cl>:
        /W2
        $<$<STREQUAL:$<CONFIG>,Debug>:/Zi>
    >
)

#-------------------------------------------------------------------------------

# Add libraries to be linked with the final executable.
target_link_libraries(${PROJECT_NAME} raylib)

# Links the appropriate frameworks needed if building for MacOS.
if(APPLE)
    target_link_libraries(${PROJECT_NAME} "-framework IOKit")
    target_link_libraries(${PROJECT_NAME} "-framework Cocoa")
    target_link_libraries(${PROJECT_NAME} "-framework OpenGL")
endif()
