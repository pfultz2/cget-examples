
find_library(LIBCRYPTO crypto)

find_path(OPENSSL_HEADER openssl/md5.h)

if(LIBCRYPTO AND OPENSSL_HEADER)
    message(STATUS "Openssl crypto found: ${LIBCRYPTO}")
else()
    # If we are in a find_package call
    if(CMAKE_FIND_PACKAGE_NAME)
        set(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE "${CMAKE_FIND_PACKAGE_NAME} could not be found because dependency openssl crypto could not be found.")
        set(${CMAKE_FIND_PACKAGE_NAME}_FOUND False)
        return()
    else()
        message(SEND_ERROR "Cannot find openssl crypto: ${LIBCRYPTO} ${OPENSSL_HEADER}")
    endif()
endif()

add_library(openssl::crypto INTERFACE IMPORTED)
set_target_properties(openssl::crypto PROPERTIES
    INTERFACE_LINK_LIBRARIES "${LIBCRYPTO}"
    INTERFACE_INCLUDE_DIRECTORIES "${OPENSSL_HEADER}"
)
