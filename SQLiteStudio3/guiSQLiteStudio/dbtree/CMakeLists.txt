set(DBTREE_SRCS
    dbtreemodel.cpp
    dbtreeitem.cpp
    dbtree.cpp
    dbtreeview.cpp
    dbtreeitemdelegate.cpp
    dbtreeitemfactory.cpp
    dbtree.ui
    )

add_object_library(gui_DBTREE
    SOURCES
        ${DBTREE_SRCS}
    LIBRARIES
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
    )