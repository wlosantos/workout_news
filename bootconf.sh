#!/bin/bash

# ::Adicionando bulma jquery fontawesome no projeto
echo 'Adicionando bulma jquery fontawesome ao projeto'
yarn add bulma @fortawesome/fontawesome-free

# ::Remover arquivos desnecessários
echo 'Atuzalizando o arquivo manifest.js'
rm -rf .app/assets/config/manifest.js
cp ./arq/manifest.js app/assets/config/manifest.js

# ::Adicionando os arquivos as pastas
echo 'Atualizando o arquivo: environment.js'
cp ./arq/environment.js config/webpack/environment.js
sleep 3s

echo 'Atualizando os arquivos javascripts'
echo 'Atualizando o arquivo: application.js'
cp  ./arq/application.js app/javascript/packs/application.js
sleep 3s

echo 'Atualizando o arquivo: custom.js'
cp  ./arq/custom.js app/javascript/packs/custom.js
sleep 3s

echo 'Criando pasta e arquivos CSS'
mkdir app/javascript/src
sleep 3s

echo 'Adicionando webpacker.yml configurado para o CSS'
rm -rf ./config/webpacker.yml
cp ./arq/webpacker.yml config/webpacker.yml
sleep 3s

echo 'Atualizando o arquivo: application.scss'
rm -rf ./app/assets/stylesheets
cp ./arq/application.scss app/javascript/src/application.scss
sleep 3s

echo 'Atualizando o arquivo: custom.scss'
cp  ./arq/custom.scss app/javascript/src/custom.scss
sleep 3s

echo 'Atualizando o arquivo: application.html.haml'
rm -rf ./app/views/layouts/application.html.erb
cp  ./arq/application.html.haml app/views/layouts/application.html.haml
sleep 3s

echo 'Adicionando os arquivos: gemfile|awesome_print|generator'
rm -rf ./Gemfile
cp ./arq/Gemfile Gemfile
sleep 3s
bundle install
sleep 3s
cp ./arq/generators.rb config/initializers/generators.rb

echo 'Arquivos atualizados com sucesso!!!'
