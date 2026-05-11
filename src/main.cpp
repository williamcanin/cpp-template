#include <fmt/core.h>
#include <CLI/CLI.hpp>
#include <app-core.hpp>

int main(int argc, char** argv) {
    CLI::App app{"My CLI"};

    std::string name;
    app.add_option("-n,--name", name, "Your Name")->required();

    CLI11_PARSE(app, argc, argv);

    fmt::print("Hello, {}!\n", name);
}