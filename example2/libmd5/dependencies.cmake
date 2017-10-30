
pkg_check_modules(LIBCRYPTO QUIET libcrypto)

if(NOT LIBCRYPTO_FOUND)
    # If we are in a find_package call
    if(CMAKE_FIND_PACKAGE_NAME)
        set(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE "${CMAKE_FIND_PACKAGE_NAME} could not be found because dependency openssl crypto could not be found.")
        set(${CMAKE_FIND_PACKAGE_NAME}_FOUND False)
        return()
    else()
        message(SEND_ERROR "Cannot find openssl crypto")
    endif()
else()
        message(STATUS "Openssl crypto found")
endif()

add_library(openssl::crypto INTERFACE IMPORTED)
set_target_properties(openssl::crypto PROPERTIES
    INTERFACE_LINK_LIBRARIES "${LIBCRYPTO_LDFLAGS}"
    INTERFACE_COMPILE_OPTIONS "${LIBCRYPTO_CFLAGS}"
)
