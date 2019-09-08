set(CONFIGMIGRATION_SOURCES
    configmigration.qrc
    configmigration.cpp
    configmigrationwizard.cpp
    configmigrationwizard.ui
    )

set(CONFIGMIGRATION_HEADERS
    configmigration.h
    configmigration_global.h
    configmigrationwizard.h
    configmigrationitem.h
    )

set(CONFIGMIGRATION_TS
    ConfigMigration_ro_RO.ts
    ConfigMigration_de.ts
    ConfigMigration_it.ts
    ConfigMigration_zh_CN.ts
    ConfigMigration_sk.ts
    ConfigMigration_ru.ts
    ConfigMigration_pt_BR.ts
    ConfigMigration_fr.ts
    ConfigMigration_es.ts
    ConfigMigration_pl.ts
    )

qt5_add_translation(CONFIGMIGRATION_QM
    ${CONFIGMIGRATION_TS}
    )

add_library(ConfigMigration
    ${CONFIGMIGRATION_SOURCES}
    ${CONFIGMIGRATION_HEADERS}
    ${CONFIGMIGRATION_QM}
    )

target_link_libraries(ConfigMigration
    PRIVATE
        coreSQLiteStudio
        guiSQLiteStudio
    )

target_compile_definitions(ConfigMigration
    PRIVATE
        CONFIGMIGRATION_LIBRARY
    )
