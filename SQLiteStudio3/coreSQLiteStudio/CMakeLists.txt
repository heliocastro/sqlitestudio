get_target_property(QTCORE_INCLUDES Qt5::Core INTERFACE_INCLUDE_DIRECTORIES)
get_target_property(QTNETWORK_INCLUDES Qt5::Network INTERFACE_INCLUDE_DIRECTORIES)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${QTCORE_INCLUDES}
    ${QTNETWORK_INCLUDES}
)

add_subdirectory(common)