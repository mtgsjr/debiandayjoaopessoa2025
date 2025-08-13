#!/bin/bash

set -e

echo "[+] Iniciando a instalação da Toolbox-AppSec, aguarde..."

echo "Atualizações iniciais do Debian"
sudo apt update && sudo apt upgrade -y

echo "[+] Instalando utilitários básicos..."
sudo apt install -y curl wget git unzip vim jq python3 python3-pip build-essential net-tools iputils-ping nmap tmux zsh golang apt-transport-https ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-buildx-plugin

echo "[+] Auto removendo programas obsoletos..."
sudo apt autoremove
