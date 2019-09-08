set(SCRIPTINGTCL_SOURCES
    scriptingtcl.qrc
    scriptingtcl.cpp
    )

set(SCRIPTINGTCL_HEADERS
    scriptingtcl.h
    scriptingtcl_global.h
    )

set(SCRIPTINGTCL_TS
    ScriptingTcl_ro_RO.ts
    ScriptingTcl_de.ts
    ScriptingTcl_it.ts
    ScriptingTcl_zh_CN.ts
    ScriptingTcl_sk.ts
    ScriptingTcl_ru.ts
    ScriptingTcl_pt_BR.ts
    ScriptingTcl_fr.ts
    ScriptingTcl_es.ts
    ScriptingTcl_pl.ts
    )

qt5_add_translation(SCRIPTINGTCL_QM
    ${SCRIPTINGTCL_TS}
    )

add_library(ScriptingTcl
    ${SCRIPTINGTCL_SOURCES}
    ${SCRIPTINGTCL_HEADERS}
    ${SCRIPTINGTCL_QM}
    )

target_link_libraries(ScriptingTcl
    PUBLIC
        eval($$system(cat
        $$TCL_CONFIG
        |
        grep
        TCL_LIBS))
        eval(LIBS
        
        $$TCL_LIBS)
    )

target_compile_definitions(ScriptingTcl
    PRIVATE
        SCRIPTINGTCL_LIBRARY
    )

