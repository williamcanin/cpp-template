#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "uso: ./new.sh nome_do_projeto"
  exit 1
fi

NAME=$1

cp -r cpp-template "$NAME"
cd "$NAME" || exit 1

sed -i "s/appname/$NAME/g" vcpkg.json CMakeLists.txt

rm -rf .git
git init

echo "Projeto $NAME criado."
