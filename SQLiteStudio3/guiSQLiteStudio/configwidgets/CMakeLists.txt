set(CONFIGWIDGETS_SRCS
    styleconfigwidget.cpp
    combodatawidget.cpp
    listtostringlisthash.cpp
    )

add_object_library(gui_CONFIGWIDGETS
    SOURCES
        ${CONFIGWIDGETS_SRCS}
    LIBRARIES
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
    )