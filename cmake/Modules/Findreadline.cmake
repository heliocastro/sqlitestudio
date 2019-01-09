# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# Findreadline
# --------
#
# Find readline
#
# Find the native READLINE includes and library This module defines
#
# ::
#
#   READLINE_FOUND  -If false, do not try to use READLINE.
#   READLINE_INCLUDE_DIR - where to find mng.h, etc.
#   READLINE_LIBRARIES - the libraries needed to use READLINE.
#   READLINE_VERSION_STRING - the version of READLINE found.

find_path(READLINE_INCLUDE_DIR
	NAMES
        readline.h
        readline/readline.h
	PATH_SUFFIXES
		include
	)

find_library(READLINE_LIBRARIES
	NAMES
        readline
	PATH_SUFFIXES
        lib
        lib64
        lib/x86_64-linux-gnu
	)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
	readline
    REQUIRED_VARS
		READLINE_LIBRARIES
     	READLINE_INCLUDE_DIR
  )

if(NOT TARGET readline::readline)
    add_library(readline::readline UNKNOWN IMPORTED)
    set_target_properties(readline::readline PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${READLINE_INCLUDE_DIR}"
        IMPORTED_LOCATION "${READLINE_LIBRARIES}"
        )
endif()

mark_as_advanced(SQLITE3_INCLUDE_DIR)