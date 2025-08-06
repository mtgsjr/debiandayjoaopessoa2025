#!/bin/bash
#setup-owasp-crapi.sh
echo "Download do projeto crAPI da OWASP"
wget https://github.com/OWASP/crAPI/archive/refs/heads/main.zip
echo "Descompacte o arquivo e entre na pasta do docker"
unzip main.zip && cd crAPI-main/deploy/docker
echo "Fazendo o download da imagem"
sudo docker-compose pull
echo "Execute o container"
sudo docker-compose -f docker-compose.yml --compatibility up -d

#Acesse o projeto em
#http://localhost:8888
