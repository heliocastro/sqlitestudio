set(REGEXPIMPORT_SOURCES
    regexpimport.qrc
    regexpimport.cpp
    regexpimport.ui
    )

set(REGEXPIMPORT_HEADERS
    regexpimport.h
    regexpimport_global.h
    )

set(REGEXPIMPORT_TS
    RegExpImport_ro_RO.ts
    RegExpImport_de.ts
    RegExpImport_it.ts
    RegExpImport_zh_CN.ts
    RegExpImport_sk.ts
    RegExpImport_ru.ts
    RegExpImport_pt_BR.ts
    RegExpImport_fr.ts
    RegExpImport_es.ts
    RegExpImport_pl.ts
    )

qt5_add_translation(REGEXPIMPORT_QM
    ${REGEXPIMPORT_TS}
    )

add_library(RegExpImport
    ${REGEXPIMPORT_SOURCES}
    ${REGEXPIMPORT_HEADERS}
    ${REGEXPIMPORT_QM}
    )

target_link_libraries(RegExpImport
    )

target_compile_definitions(RegExpImport
    PRIVATE
        REGEXPIMPORT_LIBRARY
    )

