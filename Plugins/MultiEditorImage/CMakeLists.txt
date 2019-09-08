set(MULTIEDITORIMAGE_SOURCES
    multieditorimage.qrc
    multieditorimage.cpp
    )

set(MULTIEDITORIMAGE_HEADERS
    multieditorimage.h
    multieditorimage_global.h
    )

set(MULTIEDITORIMAGE_TS
    MultiEditorImage_ro_RO.ts
    MultiEditorImage_de.ts
    MultiEditorImage_it.ts
    MultiEditorImage_zh_CN.ts
    MultiEditorImage_sk.ts
    MultiEditorImage_ru.ts
    MultiEditorImage_pt_BR.ts
    MultiEditorImage_fr.ts
    MultiEditorImage_es.ts
    MultiEditorImage_pl.ts
    )

qt5_add_translation(MULTIEDITORIMAGE_QM
    ${MULTIEDITORIMAGE_TS}
    )

add_library(MultiEditorImage
    ${MULTIEDITORIMAGE_SOURCES}
    ${MULTIEDITORIMAGE_HEADERS}
    ${MULTIEDITORIMAGE_QM}
    )

target_link_libraries(MultiEditorImage
    PRIVATE
        Qt5::Widgets
    )

target_compile_definitions(MultiEditorImage
    PRIVATE
        MULTIEDITORIMAGE_LIBRARY
    )

