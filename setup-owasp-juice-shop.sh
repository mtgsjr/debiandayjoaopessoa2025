#!/bin/bash
#OWASP Juice-Shop é provavelmente a mais moderna e sofisticadamente insegura aplicação Web!

echo "Fazendo o download da imagem"
docker pull bkimminich/juice-shop
echo "Executar o container"
docker run --rm -p 127.0.0.1:3000:3000 bkimminich/juice-shop

#Abrir em 
#http://localhost:3000
