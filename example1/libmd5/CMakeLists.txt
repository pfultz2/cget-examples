cmake_minimum_required(VERSION 3.5)
project(libmd5)
include(CMakePackageConfigHelpers)
include(CTest)

find_package(OpenSSL)

add_library(md5 src/md5.cpp)

target_include_directories(md5 PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

target_link_libraries(md5 PRIVATE OpenSSL::Crypto)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS md5 EXPORT md5-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

if(BUILD_TESTING)
add_subdirectory(test)
endif()

# 
# Install usage requirements
# 
add_library(md5::md5 ALIAS md5)
install(EXPORT md5-targets
    FILE md5-targets.cmake
    NAMESPACE md5::
    DESTINATION lib/cmake/md5
)

file(WRITE "${PROJECT_BINARY_DIR}/md5-config.cmake" "
include(CMakeFindDependencyMacro)
find_dependency(OpenSSL)
include(\"\${CMAKE_CURRENT_LIST_DIR}/md5-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/md5-config-version.cmake"
    VERSION 1.64
    COMPATIBILITY AnyNewerVersion
)

install(FILES
    "${PROJECT_BINARY_DIR}/md5-config.cmake"
    "${PROJECT_BINARY_DIR}/md5-config-version.cmake"
    DESTINATION lib/cmake/md5
)
