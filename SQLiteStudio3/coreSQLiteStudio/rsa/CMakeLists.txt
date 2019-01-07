set(RSA_SRCS
    BigInt.cpp
    Key.cpp
    KeyPair.cpp
    PrimeGenerator.cpp
    RSA.cpp
)

add_object_library(core_RSA
    SOURCES
        ${RSA_SRCS}
    LIBRARIES
        Qt5::Core
    )