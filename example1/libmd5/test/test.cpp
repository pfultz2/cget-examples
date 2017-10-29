#include <md5.hpp>
#include <iostream>

int main() {
    auto r = md5::md5("hello");
    if (r != "5d41402abc4b2a76b9719d911017c592") {
        std::cout << "Incorrect md5 sum: " << r << std::endl;
        std::abort();
    }
}

