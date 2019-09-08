set(XMLEXPORT_SOURCES
    xmlexport.qrc
    xmlexport.cpp
    XmlExport.ui
    )

set(XMLEXPORT_HEADERS
    xmlexport.h
    xmlexport_global.h
    )

set(XMLEXPORT_TS
    XmlExport_ro_RO.ts
    XmlExport_de.ts
    XmlExport_it.ts
    XmlExport_zh_CN.ts
    XmlExport_sk.ts
    XmlExport_ru.ts
    XmlExport_pt_BR.ts
    XmlExport_fr.ts
    XmlExport_es.ts
    XmlExport_pl.ts
    )

qt5_add_translation(XMLEXPORT_QM
    ${XMLEXPORT_TS}
    )

add_library(XmlExport
    ${XMLEXPORT_SOURCES}
    ${XMLEXPORT_HEADERS}
    ${XMLEXPORT_QM}
    )

target_link_libraries(XmlExport
    )

target_compile_definitions(XmlExport
    PRIVATE
        XMLEXPORT_LIBRARY
    )

