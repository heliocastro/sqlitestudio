function(add_object_library target)
    set(multiValueArgs SOURCES LIBRARIES COMPILE_DEFINITIONS INCLUDE_DIRS)
    cmake_parse_arguments(arg "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${target} OBJECT ${arg_SOURCES})
    if(arg_COMPILE_DEFINITIONS)
        target_compile_definitions(${target}
            PRIVATE
            ${arg_COMPILE_DEFINITIONS}
            )
    endif()

    if(arg_COMPILE_OPTIONS)
        target_compile_options(${target}
            PRIVATE
                ${arg_COMPILE_OPTIONS}
            )
    endif()

    if(arg_LIBRARIES)
        if(NOT ${CMAKE_VERSION} VERSION_LESS "3.12")
            target_link_libraries(${target}
                ${arg_LIBRARIES}
            )
        else()
            foreach(_library ${arg_LIBRARIES})
                get_target_property(_lib_header ${_library} INTERFACE_INCLUDE_DIRECTORIES)
                list(APPEND _lib_headers ${_lib_header})
            endforeach()
        endif()

        target_include_directories(${target}
            PRIVATE
            ${_lib_headers}
            )
    endif()

    set_target_properties(${target}
        PROPERTIES
            POSITION_INDEPENDENT_CODE ON
        )
endfunction()