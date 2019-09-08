set(SQLFORMATTERSIMPLE_SOURCES
    sqlformattersimple.qrc
    sqlformattersimpleplugin.cpp
    SqlFormatterSimple.ui
    )

set(SQLFORMATTERSIMPLE_HEADERS
    sqlformattersimpleplugin.h
    sqlformattersimple_global.h
    )

set(SQLFORMATTERSIMPLE_TS
    SqlFormatterSimple_ro_RO.ts
    SqlFormatterSimple_de.ts
    SqlFormatterSimple_it.ts
    SqlFormatterSimple_zh_CN.ts
    SqlFormatterSimple_sk.ts
    SqlFormatterSimple_ru.ts
    SqlFormatterSimple_pt_BR.ts
    SqlFormatterSimple_fr.ts
    SqlFormatterSimple_es.ts
    SqlFormatterSimple_pl.ts
    )

qt5_add_translation(SQLFORMATTERSIMPLE_QM
    ${SQLFORMATTERSIMPLE_TS}
    )

add_library(SqlFormatterSimple
    ${SQLFORMATTERSIMPLE_SOURCES}
    ${SQLFORMATTERSIMPLE_HEADERS}
    ${SQLFORMATTERSIMPLE_QM}
    )

target_link_libraries(SqlFormatterSimple
    )

target_compile_definitions(SqlFormatterSimple
    PRIVATE
        SQLFORMATTERSIMPLE_LIBRARY
    )

