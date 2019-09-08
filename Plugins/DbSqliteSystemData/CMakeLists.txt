set(DBSQLITESYSTEMDATA_SOURCES
    dbsqlitesystemdata.cpp
    dbsqlitesystemdatainstance.cpp
    systemdata_interop.c
    )

set(DBSQLITESYSTEMDATA_HEADERS
    dbsqlitesystemdata.h
    dbsqlitesystemdata_global.h
    dbsqlitesystemdatainstance.h
    systemdata_interop.h
    )

add_library(DbSqliteSystemData
    ${DBSQLITESYSTEMDATA_SOURCES}
    ${DBSQLITESYSTEMDATA_HEADERS}
    )

target_link_libraries(DbSqliteSystemData
    PUBLIC
        coreSQLiteStudio
    )

target_compile_definitions(DbSqliteSystemData
    PRIVATE
        DBSQLITESYSTEMDATA_LIBRARY
    )

