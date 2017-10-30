
add_executable(md5test test.cpp)
target_link_libraries(md5test md5::md5)

add_test(NAME md5test COMMAND md5test)
