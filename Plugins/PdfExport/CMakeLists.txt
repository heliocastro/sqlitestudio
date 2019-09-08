set(PDFEXPORT_SOURCES
    pdfexport.qrc
    pdfexport.cpp
    pdfexport.ui
    )

set(PDFEXPORT_HEADERS
    pdfexport.h
    pdfexport_global.h
    )

set(PDFEXPORT_TS
    PdfExport_ro_RO.ts
    PdfExport_de.ts
    PdfExport_it.ts
    PdfExport_zh_CN.ts
    PdfExport_sk.ts
    PdfExport_ru.ts
    PdfExport_pt_BR.ts
    PdfExport_fr.ts
    PdfExport_es.ts
    PdfExport_pl.ts
    )

qt5_add_translation(PDFEXPORT_QM
    ${PDFEXPORT_TS}
    )

add_library(PdfExport
    ${PDFEXPORT_SOURCES}
    ${PDFEXPORT_HEADERS}
    ${PDFEXPORT_QM}
    )

target_link_libraries(PdfExport
    )

target_compile_definitions(PdfExport
    PRIVATE
        PDFEXPORT_LIBRARY
    )

