CPP-TEMPLATE — Starter Kit de C++ moderno

Este repositório é um template para iniciar projetos em C++ moderno

Stack utilizada:

* Build system: CMake
* Gerenciador de dependências: vcpkg
* Compiladores: Clang ou GCC
* Editor recomendado: Visual Studio Code + clangd
* Testes: Catch2
* Biblioteca de exemplo: fmt

O objetivo é que você clone este template, e já tenha um projeto pronto para desenvolver CLI, aplicações e libs em C++23 com:

* Warnings máximos
* Sanitizers no modo Debug
* Testes configurados
* clangd funcionando perfeitamente
* Estrutura organizada e moderna

====================================================================

REQUISITOS

Você precisa ter instalado no sistema:

* cmake
* clang ou gcc
* vcpkg

No Arch Linux:

$ sudo pacman -S cmake clang gcc vcpkg

====================================================================

COMO USAR TOOLCHAIN DO VCPKG

Rode:

$ mkdir -p ~/.local/share && git clone https://github.com/microsoft/vcpkg ~/.local/share/vcpkg

$ echo 'export VCPKG_ROOT=$HOME/.local/share/vcpkg' >> ~/.zshrc && zsh

====================================================================

FAZENDO O BUILD (MODO DEBUG COM SANITIZERS)

Executar o programa:

$ ./build/app

Makefile:

$ make build

====================================================================

RODANDO OS TESTES

$ make tests

====================================================================

ADICIONANDO NOVAS DEPENDÊNCIAS

Edite o arquivo vcpkg.json e adicione a dependência na lista "dependencies".

Exemplo:

"dependencies": [
"fmt",
"catch2",
"cpr"
]

Depois, apenas rode o build novamente. O vcpkg baixa e integra automaticamente.

====================================================================

ESTRUTURA DO PROJETO

src/
Código principal da aplicação

tests/
Testes automatizados com Catch2

cmake/
Configurações de warnings e sanitizers

vcpkg.json
Suas dependências (equivalente ao Cargo.toml)

CMakeLists.txt
Configuração do build

.vscode/
Configuração para clangd funcionar perfeitamente

====================================================================

DEBUG vs RELEASE

Debug:

* Sanitizers ativos (AddressSanitizer, UndefinedBehaviorSanitizer)
* Warnings máximos

Release:

$ make release

====================================================================

FLUXO DIÁRIO DE USO

Editar código em src/
Rodar:

$ make debug

Executar com parâmetro:

$ make run -- --param <VALUE>

Ou direto no binário:

$ ./build/app --param <VALUE>

Testar:

$ make tests

====================================================================

RESULTADO

Você tem um ambiente de C++ moderno com experiência parecida com:

* Cargo.toml  ->  vcpkg.json
* cargo build ->  make debug
* cargo test  ->  make tests
* rust-analyzer -> clangd
* clippy -> warnings agressivos
* miri -> sanitizers

Esse template é ideal para CLI tools, aplicações e bibliotecas em C++ moderno.
