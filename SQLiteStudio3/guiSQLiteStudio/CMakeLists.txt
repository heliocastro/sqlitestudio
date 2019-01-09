include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}/guiSQLiteStudio_autogen/include
)

add_definitions(-DGUISQLITESTUDIO_LIBRARY)

add_subdirectory(dbtree)
add_subdirectory(datagrid)
add_subdirectory(common)
add_subdirectory(multieditor)
add_subdirectory(qhexedit2)
add_subdirectory(completer)
add_subdirectory(dialogs)
add_subdirectory(windows)
add_subdirectory(constraints)
add_subdirectory(configwidgets)
add_subdirectory(forms)

set(GUISQLITE_SRCS
    mainwindow.cpp
    iconmanager.cpp
    actionentry.cpp
    uiutils.cpp
    sqleditor.cpp
    dblistmodel.cpp
    mdiarea.cpp
    statusfield.cpp
    mdiwindow.cpp
    mdichild.cpp
    taskbar.cpp
    widgetresizer.cpp
    formview.cpp
    searchtextlocator.cpp
    dataview.cpp
    uiconfig.cpp
    sqlview.cpp
    dbobjectdialogs.cpp
    formmanager.cpp
    sqlitesyntaxhighlighter.cpp
    selectabledbmodel.cpp
    qtscriptsyntaxhighlighter.cpp
    icon.cpp
    configmapper.cpp
    dbobjlistmodel.cpp
    selectabledbobjmodel.cpp
    sqlcompareview.cpp
    uiloader.cpp
    uiscriptingcombo.cpp
    uiscriptingedit.cpp
    uicustomicon.cpp
    uiurlbutton.cpp
    uidebug.cpp
    debugconsole.cpp
    themetuner.cpp
    mainwindow.ui
    statusfield.ui
    debugconsole.ui
    icons.qrc
    guiSQLiteStudio.qrc
    )

add_library(guiSQLiteStudio SHARED
    ${GUISQLITE_SRCS}
    $<TARGET_OBJECTS:gui_DBTREE>
    $<TARGET_OBJECTS:gui_DATAGRID>
    $<TARGET_OBJECTS:gui_COMMON>
    $<TARGET_OBJECTS:gui_MULTIEDITOR>
    $<TARGET_OBJECTS:gui_QHEXEDIT2>
    $<TARGET_OBJECTS:gui_COMPLETER>
    $<TARGET_OBJECTS:gui_DIALOGS>
    $<TARGET_OBJECTS:gui_WINDOWS>
    $<TARGET_OBJECTS:gui_CONSTRAINTS>
    $<TARGET_OBJECTS:gui_CONFIGWIDGETS>
    $<TARGET_OBJECTS:gui_FORMS>
    )

target_link_libraries(guiSQLiteStudio
    PRIVATE
        coreSQLiteStudio
    PUBLIC
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
        Qt5::UiTools
        Qt5::Xml
        Qt5::Svg
)

target_include_directories(guiSQLiteStudio INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/guiSQLiteStudio_autogen/include>
)

set_target_properties(guiSQLiteStudio PROPERTIES
    VERSION 1.0.0
    SOVERSION 1
    )