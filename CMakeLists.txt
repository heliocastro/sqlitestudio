cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

project(sqlitestudio
    VERSION 3.2.1
    LANGUAGES C CXX)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/Modules)

include(add_object_library)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(BUILD_SHARED_LIBS ON)

find_package(Qt5 COMPONENTS Core Gui Network Xml Script Widgets LinguistTools UiTools REQUIRED)
find_package(SQLite3 REQUIRED)
find_package(Curses REQUIRED)

add_subdirectory(SQLiteStudio3)
#add_subdirectory(Plugins)
