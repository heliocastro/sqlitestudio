set(SQLITESTUDIO_SOURCES
    sqlitestudio.qrc
    main.cpp
    singleapplication/singleapplication.cpp
    )

set(SQLITESTUDIO_HEADERS
    singleapplication/singleapplication.h
    singleapplication/singleapplication_p.h
    )

set(SQLITESTUDIO_TS
    translations/sqlitestudio_ro_RO.ts
    translations/sqlitestudio_de.ts
    translations/sqlitestudio_it.ts
    translations/sqlitestudio_zh_CN.ts
    translations/sqlitestudio_sk.ts
    translations/sqlitestudio_ru.ts
    translations/sqlitestudio_pt_BR.ts
    translations/sqlitestudio_fr.ts
    translations/sqlitestudio_es.ts
    translations/sqlitestudio_pl.ts
    )

qt5_add_translation(SQLITESTUDIO_QM
    ${SQLITESTUDIO_TS}
    )

add_executable(sqlitestudio
    ${SQLITESTUDIO_SOURCES}
    ${SQLITESTUDIO_HEADERS}
    ${SQLITESTUDIO_QM}
    )

target_link_libraries(sqlitestudio
    PRIVATE
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
        Qt5::Network
    PUBLIC
        coreSQLiteStudio
        guiSQLiteStudio
    )

target_compile_definitions(sqlitestudio
    PRIVATE
        QAPPLICATION_CLASS=QApplication
    )

install(TARGETS sqlitestudio
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )

