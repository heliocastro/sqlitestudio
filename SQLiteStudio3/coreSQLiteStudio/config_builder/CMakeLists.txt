set(CONFIG_BUILDER_SRCS
    cfgcategory.cpp
    cfgentry.cpp
    cfglazyinitializer.cpp
    cfgmain.cpp
    )

add_object_library(core_CONFIG_BUILDER
    SOURCES
        ${CONFIG_BUILDER_SRCS}
    LIBRARIES
        Qt5::Core
)