set(DBANDROID_SOURCES
    dbandroid.qrc
    dbandroid.cpp
    dbandroidinstance.cpp
    sqlqueryandroid.cpp
    dbandroidurl.cpp
    dbandroidpathdialog.cpp
    adbmanager.cpp
    sqlresultrowandroid.cpp
    dbandroidjsonconnection.cpp
    dbandroidshellconnection.cpp
    dbandroidconnection.cpp
    dbandroidconnectionfactory.cpp
    dbandroidpathdialog.ui
    )

set(DBANDROID_HEADERS
    dbandroid.h
    dbandroid_global.h
    dbandroidinstance.h
    sqlqueryandroid.h
    dbandroidurl.h
    dbandroidpathdialog.h
    adbmanager.h
    dbandroidconnection.h
    dbandroidmode.h
    sqlresultrowandroid.h
    dbandroidjsonconnection.h
    dbandroidshellconnection.h
    dbandroidconnectionfactory.h
    )

set(DBANDROID_TS
    DbAndroid_ro_RO.ts
    DbAndroid_de.ts
    )

qt5_add_translation(DBANDROID_QM
    ${DBANDROID_TS}
    )

add_library(DbAndroid
    ${DBANDROID_SOURCES}
    ${DBANDROID_HEADERS}
    ${DBANDROID_QM}
    )

target_link_libraries(DbAndroid
    PRIVATE
        Qt5::Widgets
        Qt5::Network
        coreSQLiteStudio
        guiSQLiteStudio
    )

target_compile_definitions(DbAndroid
    PRIVATE
        DBANDROID_LIBRARY
    )

