set(DBSQLITE2_SOURCES
    dbsqlite2.cpp
    dbsqlite2instance.cpp
    queryexecutorsqlite2delete.cpp
    )

set(DBSQLITE2_HEADERS
    dbsqlite2.h
    dbsqlite2_global.h
    dbsqlite2instance.h
    queryexecutorsqlite2delete.h
    )

add_library(DbSqlite2
    ${DBSQLITE2_SOURCES}
    ${DBSQLITE2_HEADERS}
    )

target_link_libraries(DbSqlite2
    PUBLIC
        sqlite
    PRIVATE
        coreSQLiteStudio
        guiSQLiteStudio

    )

target_compile_definitions(DbSqlite2
    PRIVATE
        DBSQLITE2_LIBRARY
    )

