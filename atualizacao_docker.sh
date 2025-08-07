#!/bin/bash

echo "Versoes atuais do docker e docker-compose:"
docker --version
docker-compose --version

echo -n "Atualizando o Docker e o Docker-Compose..."

sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian   bookworm stable

# atualizando
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Mostrar versoes instaladas
echo "Versoes instaladas"
docker --version
docker-compose --version
