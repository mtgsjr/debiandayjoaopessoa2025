#!/bin/bash

set -e

echo "[+] Iniciando a instalação da AppSec Toolbox..."

Atualizações iniciais
sudo apt update && sudo apt upgrade -y

Diretórios da toolbox
mkdir -p ~/toolbox-appsec/{recon,fuzzing,scanners,static-analysis,utils,scripts}

Dependências básicas
echo "[+] Instalando utilitários básicos..."
sudo apt install -y curl wget git unzip vim jq
python3 python3-pip build-essential net-tools
iputils-ping nmap tmux zsh docker.io docker-compose golang

Instalar ffuf
echo "[+] Instalando ffuf..."
go install github.com/ffuf/ffuf/v2@latest
cp ~/go/bin/ffuf ~/toolbox-appsec/fuzzing/

Instalar Subfinder
echo "[+] Instalando subfinder..."
git clone https://github.com/projectdiscovery/subfinder.git
mv subfinder toolbox-appsec/recon/

Instalar Amass
echo "[+] Instalando Amass..."
git clone https://github.com/owasp-amass/amass.git
mv amass toolbox-appsec/recon

Instalar Wfuzz
echo "[+] Instalando wfuzz..."
sudo apt install -y wfuzz
ln -s $(which wfuzz) ~/toolbox-appsec/fuzzing/wfuzz

Instalar SQLMap
echo "[+] Instalando SQLMap..."
sudo apt install -y sqlmap
ln -s $(which sqlmap) ~/toolbox-appsec/scanners/sqlmap

Instalar Nikto
echo "[+] Instalando Nikto..."
git clone https://github.com/sullo/nikto.git
mv nikto toolbox-appsec/scanners

Instalar ZAP
echo "[+] Instalando OWASP ZAP..."
git clone https://github.com/zaproxy/zaproxy.git
mv zaproxy toolbox-appsec/scanners/zap

Instalar XSStrike
#echo "[+] Instalando XSStrike..."
git clone https://github.com/s0md3v/XSStrike ~/toolbox-appsec/scanners/XSStrike
pip3 install -r ~/toolbox-appsec/scanners/XSStrike/requirements.txt --break-system-packages

Instalar Dirsearch
echo "[+] Instalando Dirsearch..."
git clone https://github.com/maurosoria/dirsearch.git
mv dirsearch toolbox-appsec/fuzzing/

Instalar Semgrep
echo "[+] Instalando Semgrep..."
pip3 install semgrep --break-system-packages
ln -s $(which semgrep) ~/toolbox-appsec/static-analysis/semgrep

Instalar Bandit
echo "[+] Instalando Bandit..."
pip3 install bandit --break-system-packages
ln -s $(which bandit) ~/toolbox-appsec/static-analysis/bandit

Instalar Gitleaks
echo "[+] Instalando Gitleaks..."
git clone https://github.com/gitleaks/gitleaks.git
mv gitleaks toolbox-appsec/utils/

Instalar Trivy
echo "[+] Instalando Trivy..."
git clone https://github.com/aquasecurity/trivy
mv trivy toolbox-appsec/utils/

Permissões Docker
sudo usermod -aG docker $USER

echo "[+] Instalação concluída com sucesso!"
echo "[!] Faça logout/login para aplicar permissões do Docker (ou use 'newgrp docker')"
