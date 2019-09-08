set(DBSQLITEWX_SOURCES
    dbsqlitewx.cpp
    dbsqlitewxinstance.cpp
    )

set(DBSQLITEWX_HEADERS
    dbsqlitewx.h
    dbsqlitewx_global.h
    dbsqlitewxinstance.h
    )

add_library(DbSqliteWx
    ${DBSQLITEWX_SOURCES}
    ${DBSQLITEWX_HEADERS}
    )

target_link_libraries(DbSqliteWx
    )

target_compile_definitions(DbSqliteWx
    PRIVATE
        DBSQLITEWX_LIBRARY
    )

