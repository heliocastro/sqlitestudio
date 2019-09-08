set(SQLEXPORT_SOURCES
    sqlexport.qrc
    sqlexport.cpp
    SqlExportQuery.ui
    SqlExportCommon.ui
    )

set(SQLEXPORT_HEADERS
    sqlexport.h
    sqlexport_global.h
    )

set(SQLEXPORT_TS
    SqlExport_ro_RO.ts
    SqlExport_de.ts
    SqlExport_it.ts
    SqlExport_zh_CN.ts
    SqlExport_sk.ts
    SqlExport_ru.ts
    SqlExport_pt_BR.ts
    SqlExport_fr.ts
    SqlExport_es.ts
    SqlExport_pl.ts
    )

qt5_add_translation(SQLEXPORT_QM
    ${SQLEXPORT_TS}
    )

add_library(SqlExport
    ${SQLEXPORT_SOURCES}
    ${SQLEXPORT_HEADERS}
    ${SQLEXPORT_QM}
    )

target_link_libraries(SqlExport
    )

target_compile_definitions(SqlExport
    PRIVATE
        SQLEXPORT_LIBRARY
    )

