set(CSVEXPORT_SOURCES
    csvexport.qrc
    csvexport.cpp
    CsvExport.ui
    )

set(CSVEXPORT_HEADERS
    csvexport.h
    csvexport_global.h
    )

set(CSVEXPORT_TS
    CsvExport_ro_RO.ts
    CsvExport_de.ts
    CsvExport_it.ts
    CsvExport_zh_CN.ts
    CsvExport_sk.ts
    CsvExport_ru.ts
    CsvExport_pt_BR.ts
    CsvExport_fr.ts
    CsvExport_es.ts
    CsvExport_pl.ts
    )

qt5_add_translation(CSVEXPORT_QM
    ${CSVEXPORT_TS}
    )

add_library(CsvExport
    ${CSVEXPORT_SOURCES}
    ${CSVEXPORT_HEADERS}
    ${CSVEXPORT_QM}
    )

target_link_libraries(CsvExport
    PRIVATE
        coreSQLiteStudio
        guiSQLiteStudio
    )

target_compile_definitions(CsvExport
    PRIVATE
        CSVEXPORT_LIBRARY
    )

