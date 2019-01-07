include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--as-needed,--no-undefined")

add_definitions(-DGUISQLITESTUDIO_LIBRARY