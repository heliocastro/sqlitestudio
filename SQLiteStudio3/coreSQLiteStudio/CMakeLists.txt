include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
)

set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--as-needed,--no-undefined")
add_definitions(-DCORESQLITESTUDIO_LIBRARY)

add_subdirectory(common)
add_subdirectory(db)
add_subdirectory(services)
add_subdirectory(config_builder)
add_subdirectory(parser)
add_subdirectory(plugins)
add_subdirectory(rsa)
add_subdirectory(impl)
add_subdirectory(diff)

set(CORESQLITE_SRCS
    committable.cpp
    completioncomparer.cpp
    completionhelper.cpp
    csvformat.cpp
    csvserializer.cpp
    datatype.cpp
    dbattacher.cpp
    dbobjectorganizer.cpp
    dbversionconverter.cpp
    ddlhistorymodel.cpp
    expectedtoken.cpp
    exportworker.cpp
    importworker.cpp
    log.cpp
    pluginservicebase.cpp
    populateworker.cpp
    qio.cpp
    querygenerator.cpp
    querymodel.cpp
    returncode.cpp
    schemaresolver.cpp
    selectresolver.cpp
    sqlitestudio.cpp
    sqlhistorymodel.cpp
    tablemodifier.cpp
    translations.cpp
    tsvserializer.cpp
    viewmodifier.cpp
    coreSQLiteStudio.qrc
)

set(CORESQLITE_TS
    translations/coreSQLiteStudio_de.ts
    translations/coreSQLiteStudio_it.ts
    translations/coreSQLiteStudio_zh_CN.ts
    translations/coreSQLiteStudio_sk.ts
    translations/coreSQLiteStudio_ru.ts
    translations/coreSQLiteStudio_pt_BR.ts
    translations/coreSQLiteStudio_fr.ts
    translations/coreSQLiteStudio_es.ts
    translations/coreSQLiteStudio_pl.ts
)

qt5_add_translation(CORESQLITE_QM ${CORESQLITE_TS})

add_library(coreSQLiteStudio SHARED
    ${CORESQLITE_SRCS}
    ${CORESQLITE_QM}
    $<TARGET_OBJECTS:core_COMMON>
    $<TARGET_OBJECTS:core_PLUGINS>
    $<TARGET_OBJECTS:core_PARSER>
    $<TARGET_OBJECTS:core_RSA>
    $<TARGET_OBJECTS:core_DB>
    $<TARGET_OBJECTS:core_IMPL>
    $<TARGET_OBJECTS:core_SERVICES>
    $<TARGET_OBJECTS:core_CONFIG_BUILDER>
    $<TARGET_OBJECTS:core_DIFF>
    )

target_link_libraries(coreSQLiteStudio
    PUBLIC
        Qt5::Core
        Qt5::Network
        Qt5::Script
        SQLite3::SQLite3
)

set_target_properties(coreSQLiteStudio PROPERTIES
    VERSION 1.0.0
    SOVERSION 1
    INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}
    )

install(TARGETS coreSQLiteStudio
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        )
