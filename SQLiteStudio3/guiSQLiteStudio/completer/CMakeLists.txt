set(COMPLETER_SRCS
    completerwindow.cpp
    completermodel.cpp
    completeritemdelegate.cpp
    completerview.cpp
    completerwindow.ui
    )

add_object_library(gui_COMPLETER
    SOURCES
        ${COMPLETER_SRCS}
    LIBRARIES
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
    )