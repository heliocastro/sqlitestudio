set(CSVIMPORT_SOURCES
    csvimport.qrc
    csvimport.cpp
    CsvImportOptions.ui
    )

set(CSVIMPORT_HEADERS
    csvimport.h
    csvimport_global.h
    )

set(CSVIMPORT_TS
    CsvImport_ro_RO.ts
    CsvImport_de.ts
    CsvImport_it.ts
    CsvImport_zh_CN.ts
    CsvImport_sk.ts
    CsvImport_ru.ts
    CsvImport_pt_BR.ts
    CsvImport_fr.ts
    CsvImport_es.ts
    CsvImport_pl.ts
    )

qt5_add_translation(CSVIMPORT_QM
    ${CSVIMPORT_TS}
    )

add_library(CsvImport
    ${CSVIMPORT_SOURCES}
    ${CSVIMPORT_HEADERS}
    ${CSVIMPORT_QM}
    )

target_link_libraries(CsvImport
    PRIVATE
        coreSQLiteStudio
        guiSQLiteStudio
    )

target_compile_definitions(CsvImport
    PRIVATE
        CSVIMPORT_LIBRARY
    )

