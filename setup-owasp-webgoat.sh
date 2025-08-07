#!/bin/bash
#Conhecida como o Bode da Web
#setup-owasp-webgoat.sh

echo "O projeto pode ser acessado em https://github.com/WebGoat/WebGoat"
echo " " 
echo "Instale o JDK Java"
sudo apt install -y openjdk-17-jre
echo "Este comando fará o download da imagem se ela não existir no Debian e depois executará o container"
sudo docker run -it -p 127.0.0.1:8080:8080 -p 127.0.0.1:9090:9090 webgoat/webgoat

#Acesse:
#http://localhost:8080/WebGoat
