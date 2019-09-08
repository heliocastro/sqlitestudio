set(HTMLEXPORT_SOURCES
    htmlexport.qrc
    htmlexport.cpp
    htmlexport.ui
    )

set(HTMLEXPORT_HEADERS
    htmlexport.h
    htmlexport_global.h
    )

set(HTMLEXPORT_TS
    HtmlExport_ro_RO.ts
    HtmlExport_de.ts
    HtmlExport_it.ts
    HtmlExport_zh_CN.ts
    HtmlExport_sk.ts
    HtmlExport_ru.ts
    HtmlExport_pt_BR.ts
    HtmlExport_fr.ts
    HtmlExport_es.ts
    HtmlExport_pl.ts
    )

qt5_add_translation(HTMLEXPORT_QM
    ${HTMLEXPORT_TS}
    )

add_library(HtmlExport
    ${HTMLEXPORT_SOURCES}
    ${HTMLEXPORT_HEADERS}
    ${HTMLEXPORT_QM}
    )

target_link_libraries(HtmlExport
    )

target_compile_definitions(HtmlExport
    PRIVATE
        HTMLEXPORT_LIBRARY
    )

