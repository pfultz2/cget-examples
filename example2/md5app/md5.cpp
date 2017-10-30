#include <md5.hpp>
#include <vector>
#include <string>
#include <iostream>

int main(int argc, char const *argv[]) {
    std::vector<std::string> args(argv, argv+argc);
    std::cout << md5::md5(args.at(1)) << std::endl;
}
