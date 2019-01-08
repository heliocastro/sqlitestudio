set(FORMS_SRCS
    sqlformatterplugin.ui
    )

add_object_library(gui_FORMS
    SOURCES
        ${FORMS_SRCS}
    LIBRARIES
        Qt5::Core
        Qt5::Gui
    )