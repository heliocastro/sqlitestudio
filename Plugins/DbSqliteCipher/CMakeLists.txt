set(DBSQLITECIPHER_SOURCES
    dbsqlitecipher.qrc
    dbsqlitecipher.cpp
    dbsqlitecipherinstance.cpp
    sqlcipher.c
    )

set(DBSQLITECIPHER_HEADERS
    dbsqlitecipher.h
    dbsqlitecipher_global.h
    dbsqlitecipherinstance.h
    sqlcipher.h
    )

set(DBSQLITECIPHER_TS
    DbSqliteCipher_ro_RO.ts
    DbSqliteCipher_de.ts
	DbSqliteCipher_it.ts
	DbSqliteCipher_zh_CN.ts
	DbSqliteCipher_sk.ts
	DbSqliteCipher_ru.ts
	DbSqliteCipher_pt_BR.ts
	DbSqliteCipher_fr.ts
	DbSqliteCipher_es.ts
	DbSqliteCipher_pl.ts
    )

qt5_add_translation(DBSQLITECIPHER_QM
    ${DBSQLITECIPHER_TS}
    )

add_library(DbSqliteCipher
    ${DBSQLITECIPHER_SOURCES}
    ${DBSQLITECIPHER_HEADERS}
    ${DBSQLITECIPHER_QM}
    )

target_link_libraries(DbSqliteCipher
    PRIVATE
        coreSQLiteStudio
        guiSQLiteStudio
    )

if(UNIX)
    target_link_libraries(DbSqliteCipher
        PUBLIC
            crypto
            pthread
            dl
    )

    target_compile_definitions(DbSqliteCipher
    PRIVATE
        SQLITE_OS_UNIX=1
    )
endif(UNIX)

target_compile_definitions(DbSqliteCipher
    PRIVATE
        DBSQLITECIPHER_LIBRARY
        SQLITE_HAS_CODEC
        SQLCIPHER_CRYPTO_OPENSSL
        BUILD_sqlite
        NDEBUG SQLITE_ALLOW_XTHREAD_CONNECT=1
        SQLITE_THREADSAFE=1
        SQLITE_TEMP_STORE=2
    )

