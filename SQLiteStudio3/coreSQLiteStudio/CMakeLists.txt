include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
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

set( CORESQLITE_SRCS
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

add_library(coreSQLiteStudio SHARED
    ${CORESQLITE_SRCS}
    $<TARGET_OBJECTS:core_COMMON>
    $<TARGET_OBJECTS:core_PLUGINS>
    $<TARGET_OBJECTS:core_PARSER>
    $<TARGET_OBJECTS:core_RSA>
    $<TARGET_OBJECTS:core_DB>
    $<TARGET_OBJECTS:core_IMPL>
    $<TARGET_OBJECTS:core_SERVICES>
    $<TARGET_OBJECTS:core_CONFIG_BUILDER>
    )

target_link_libraries(coreSQLiteStudio
    PUBLIC
        Qt5::Core
        Qt5::Network
        Qt5::Script
        SQLite3::SQLite3
)