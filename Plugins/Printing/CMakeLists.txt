set(PRINTING_SOURCES
    printing.qrc
    printing.cpp
    printingexport.cpp
    )

set(PRINTING_HEADERS
    printing.h
    printing_global.h
    printingexport.h
    )

set(PRINTING_TS
    Printing_ro_RO.ts
    Printing_de.ts
    Printing_it.ts
    Printing_zh_CN.ts
    Printing_sk.ts
    Printing_ru.ts
    Printing_pt_BR.ts
    Printing_fr.ts
    Printing_es.ts
    Printing_pl.ts
    )

qt5_add_translation(PRINTING_QM
    ${PRINTING_TS}
    )

add_library(Printing
    ${PRINTING_SOURCES}
    ${PRINTING_HEADERS}
    ${PRINTING_QM}
    )

target_compile_definitions(Printing
    PRIVATE
        PRINTING_LIBRARY
    )

