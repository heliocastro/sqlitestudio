set(IMPL_SRCS
    dbattacherimpl.cpp
)

add_object_library(core_IMPL
    SOURCES
        dbattacherimpl.cpp
    LIBRARIES
        Qt5::Core
)