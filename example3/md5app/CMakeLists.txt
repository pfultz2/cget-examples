cmake_minimum_required(VERSION 3.5)
project(md5app)
include(CTest)

find_package(md5)

add_executable(md5app md5.cpp)
target_link_libraries(md5app md5::md5)

install(TARGETS md5app
    RUNTIME DESTINATION bin
)

add_test(NAME md5test COMMAND md5app hello)
set_tests_properties(md5test PROPERTIES PASS_REGULAR_EXPRESSION 5d41402abc4b2a76b9719d911017c592)
