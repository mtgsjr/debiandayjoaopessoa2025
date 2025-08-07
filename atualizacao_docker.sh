#!/bin/bash

echo "Versoes atuais do docker e docker-compose:"
docker --version
docker-compose --version

echo -n "Atualizando o Docker e o Docker-Compose..."

sudo apt update
sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-buildx-plugin -y

sudo usermod -aG docker $USER
newgrp docker
docker compose version
sudo apt autoremove
