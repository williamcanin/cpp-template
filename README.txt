README.txt

CPP-TEMPLATE — Starter Kit de C++ moderno

Este repositório é um template para iniciar projetos em C++ moderno com uma experiência parecida com Rust + Cargo.

Stack utilizada:

* Build system: CMake
* Gerenciador de dependências: vcpkg
* Compiladores: Clang ou GCC
* Editor recomendado: Visual Studio Code + clangd
* Testes: Catch2
* Biblioteca de exemplo: fmt

O objetivo é que você clone este template, rode um script, e já tenha um projeto pronto para desenvolver CLI, aplicações e libs em C++23 com:

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

pacman -S cmake clang gcc vcpkg

====================================================================

ONDE FICA O TOOLCHAIN DO VCPKG (ARCH)

Quando instalado via pacman, o toolchain file fica em:

/usr/share/vcpkg/scripts/buildsystems/vcpkg.cmake

Você vai usar esse caminho nos comandos de build.

====================================================================

CRIANDO UM NOVO PROJETO (EQUIVALENTE AO “cargo new”)

1. Dê permissão ao script:

chmod +x new.sh

2. Crie um novo projeto:

./new.sh meu_cli

Isso criará uma nova pasta chamada "meu_cli" já com git iniciado e tudo configurado.

3. Entre na pasta:

cd meu_cli

====================================================================

FAZENDO O BUILD (MODO DEBUG COM SANITIZERS)

Rode:

cmake -B build -S . 
-DCMAKE_TOOLCHAIN_FILE=/usr/share/vcpkg/scripts/buildsystems/vcpkg.cmake 
-DCMAKE_BUILD_TYPE=Debug

cmake --build build

Executar o programa:

./build/meu_cli

====================================================================

RODANDO OS TESTES

ctest --test-dir build

====================================================================

ADICIONANDO NOVAS DEPENDÊNCIAS (TIPO “cargo add”)

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

cmake -B build -S . 
-DCMAKE_TOOLCHAIN_FILE=/usr/share/vcpkg/scripts/buildsystems/vcpkg.cmake 
-DCMAKE_BUILD_TYPE=Release

====================================================================

FLUXO DIÁRIO DE USO

Editar código em src/
Rodar:

cmake --build build

Executar:

./build/nome_do_projeto

Testar:

ctest --test-dir build

====================================================================

RESULTADO

Você tem um ambiente de C++ moderno com experiência parecida com:

* Cargo.toml  ->  vcpkg.json
* cargo build ->  cmake --build
* cargo test  ->  ctest
* rust-analyzer -> clangd
* clippy -> warnings agressivos
* miri -> sanitizers

Esse template é ideal para CLI tools, aplicações e bibliotecas em C++ moderno.
