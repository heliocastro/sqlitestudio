set(QHEXEDIT2_SRCS
    xbytearray.cpp
    qhexedit_p.cpp
    qhexedit.cpp
    commands.cpp
    )

add_object_library(gui_QHEXEDIT2
    SOURCES
        ${QHEXEDIT2_SRCS}
    LIBRARIES
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
    )