cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

project(sqlitestudio
    VERSION 3.2.1
    LANGUAGES C CXX)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/Modules)

include(sqlitestudio_defaults)
include(add_object_library)

find_package(Qt5 COMPONENTS REQUIRED
    Core
    Gui
    Network
    Xml
    Script
    Widgets
    LinguistTools
    UiTools
    Svg
    )

find_package(SQLite3 REQUIRED)

if(UNIX)
    find_package(Curses REQUIRED)
    find_package(readline REQUIRED)
endif()

add_subdirectory(SQLiteStudio3)
#add_subdirectory(Plugins)
