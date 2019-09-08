set(JSONEXPORT_SOURCES
    jsonexport.qrc
    jsonexport.cpp
    jsonexport.ui
    )

set(JSONEXPORT_HEADERS
    jsonexport.h
    jsonexport_global.h
    )

set(JSONEXPORT_TS
    JsonExport_ro_RO.ts
    JsonExport_de.ts
    JsonExport_it.ts
    JsonExport_zh_CN.ts
    JsonExport_sk.ts
    JsonExport_ru.ts
    JsonExport_pt_BR.ts
    JsonExport_fr.ts
    JsonExport_es.ts
    JsonExport_pl.ts
    )

qt5_add_translation(JSONEXPORT_QM
    ${JSONEXPORT_TS}
    )

add_library(JsonExport
    ${JSONEXPORT_SOURCES}
    ${JSONEXPORT_HEADERS}
    ${JSONEXPORT_QM}
    )

target_link_libraries(JsonExport
    )

target_compile_definitions(JsonExport
    PRIVATE
        JSONEXPORT_LIBRARY
    )

