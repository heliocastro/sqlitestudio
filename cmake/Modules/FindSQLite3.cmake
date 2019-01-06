# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# FindSQLite3
# --------
#
# Find SQLite3
#
# Find the native SQLite3 includes and library This module defines
#
# ::
#
#   SQLITE3_FOUND  -If false, do not try to use SQLITE3.
#   SQLITE3_INCLUDE_DIR - where to find mng.h, etc.
#   SQLITE3_LIBRARIES - the libraries needed to use SQLITE3.
#   SQLITE3_VERSION_STRING - the version of SQLITE3 found.
#

find_path(SQLITE3_INCLUDE_DIR
	NAMES
        sqlite3.h
	PATH_SUFFIXES
		include
	)

find_library(SQLITE3_LIBRARIES
	NAMES
        sqlite3
	PATH_SUFFIXES
        lib
        lib64
        lib/x86_64-linux-gnu
	)

if(SQLITE3_INCLUDE_DIR AND EXISTS "${SQLITE3_INCLUDE_DIR}/sqlite3.h")
    file(STRINGS "${SQLITE3_INCLUDE_DIR}/sqlite3.h" SQLITE3_H_VERSION REGEX "#define SQLITE_VERSION .*")
    string(REGEX MATCH "#define SQLITE_VERSION       ([0-9]*)" _ "${SQLITE3_H_VERSION}")
    message(STATUS "${CMAKE_MATCH_1}")
endif()
set(SQLITE3_VERSION_STRING "3.22.0")

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
	SQLite3
    REQUIRED_VARS
        SQLITE3_VERSION_STRING
		SQLITE3_LIBRARIES
     	SQLITE3_INCLUDE_DIR
  )

if(NOT TARGET SQLITE3::SQLITE3)
    add_library(SQLITE3::SQLITE3 UNKNOWN IMPORTED)
    set_target_properties(SQLITE3::SQLITE3 PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${SQLITE3_INCLUDE_DIR}")
    set_property(TARGET SQLITE3::SQLITE3 APPEND PROPERTY
        IMPORTED_LOCATION "${SQLITE3_LIBRARIES}")
endif()

mark_as_advanced(SQLITE3_INCLUDE_DIR)


