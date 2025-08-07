#!/bin/bash

set -e

echo "[+] Iniciando a instalação da Toolbox-AppSec, aguarde..."

echo "Atualizações iniciais do Debian"
sudo apt update && sudo apt upgrade -y

echo "Criando os diretórios da toolbox"
mkdir -p ~/toolbox-appsec/{recon,fuzzing,scanners,static-analysis,utils,scripts}

echo "[+] Instalando utilitários básicos..."
sudo apt install -y curl wget git unzip vim jq python3 python3-pip build-essential net-tools iputils-ping nmap tmux zsh docker.io docker-compose golang

echo "[+] Instalando ffuf..."
go install github.com/ffuf/ffuf/v2@latest
cp ~/go/bin/ffuf ~/toolbox-appsec/fuzzing/

echo "[+] Instalando subfinder..."
git clone https://github.com/projectdiscovery/subfinder.git
mv subfinder toolbox-appsec/recon/

echo "[+] Instalando Amass..."
git clone https://github.com/owasp-amass/amass.git
mv amass toolbox-appsec/recon

echo "[+] Instalando wfuzz..."
sudo apt install -y wfuzz
ln -s $(which wfuzz) ~/toolbox-appsec/fuzzing/wfuzz

echo "[+] Instalando SQLMap..."
sudo apt install -y sqlmap
ln -s $(which sqlmap) ~/toolbox-appsec/scanners/sqlmap

echo "[+] Instalando Nikto..."
git clone https://github.com/sullo/nikto.git
mv nikto toolbox-appsec/scanners

echo "[+] Instalando OWASP ZAP..."
git clone https://github.com/zaproxy/zaproxy.git
mv zaproxy toolbox-appsec/scanners/zap

echo "[+] Instalando XSStrike..."
git clone https://github.com/s0md3v/XSStrike ~/toolbox-appsec/scanners/XSStrike
pip3 install -r ~/toolbox-appsec/scanners/XSStrike/requirements.txt --break-system-packages

echo "[+] Instalando Dirsearch..."
git clone https://github.com/maurosoria/dirsearch.git
mv dirsearch toolbox-appsec/fuzzing/

echo "[+] Instalando Semgrep..."
pip3 install semgrep --break-system-packages
ln -s $(which semgrep) ~/toolbox-appsec/static-analysis/semgrep

echo "[+] Instalando Bandit..."
pip3 install bandit --break-system-packages
ln -s $(which bandit) ~/toolbox-appsec/static-analysis/bandit

echo "[+] Instalando Gitleaks..."
git clone https://github.com/gitleaks/gitleaks.git
mv gitleaks toolbox-appsec/utils/

echo "[+] Instalando Trivy..."
git clone https://github.com/aquasecurity/trivy
mv trivy toolbox-appsec/utils/

echo "Atribuindo as permissões ao Docker"
sudo usermod -aG docker $USER
sudo usermod -aG sudo vboxuser

echo "[+] Instalação concluída com sucesso!"
echo "[!] Faça logout/login para aplicar permissões do Docker (ou use 'newgrp docker')"
