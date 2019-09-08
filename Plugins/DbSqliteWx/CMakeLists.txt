set(DBSQLITEWX_SOURCES
    dbsqlitewx.cpp
    dbsqlitewxinstance.cpp
    chacha20poly1305.c
    fastpbkdf2.c
    fileio.c
    md5.c
    rekeyvacuum.c
    sha1.c
    shathree.c
    test_windirent.c
    )

set(DBSQLITEWX_HEADERS
    dbsqlitewx.h
    codec.h
    rijndael.h
    sha2.h
    sqlite3ext.h
    sqlite3userauth.h
    dbsqlitewx_global.h
    dbsqlitewxinstance.h
    fastpbkdf2.h
    sha1.h
    sqlite3secure.h
    test_windirent.h
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

