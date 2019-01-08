set(DIFF_SRCS
    diff_match.cpp
)

add_object_library(core_DIFF
    SOURCES
        diff_match_patch.cpp
    LIBRARIES
        Qt5::Core
)