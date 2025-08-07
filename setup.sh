#!/bin/bash

set -e

echo "[+] Iniciando a instalação da Toolbox-AppSec, aguarde..."

echo "Atualizações iniciais do Debian"
sudo apt update && sudo apt upgrade -y

echo "Criando os diretórios da toolbox"
mkdir -p toolbox-appsec/{recon,fuzzing,scanners,static-analysis,utils,scripts}

echo "[+] Instalando utilitários básicos..."
sudo apt install -y curl wget git unzip vim jq python3 python3-pip build-essential net-tools iputils-ping nmap tmux zsh docker.io docker-compose golang

echo "[+] Ferramenta 1/13 -> Instalando ffuf..."
go install github.com/ffuf/ffuf/v2@latest
cp ~/go/bin/ffuf toolbox-appsec/fuzzing/

echo "[+] Ferramenta 2/13 -> Instalando subfinder..."
git clone https://github.com/projectdiscovery/subfinder.git
mv subfinder toolbox-appsec/recon/

echo "[+] Ferramenta 3/13 -> Instalando Amass..."
git clone https://github.com/owasp-amass/amass.git
mv amass toolbox-appsec/recon

echo "[+] Ferramenta 4/13 -> Instalando wfuzz..."
sudo apt install -y wfuzz
ln -s $(which wfuzz) toolbox-appsec/fuzzing/wfuzz

echo "[+] Ferramenta 5/13 -> Instalando SQLMap..."
sudo apt install -y sqlmap
ln -s $(which sqlmap) toolbox-appsec/scanners/sqlmap

echo "[+] Ferramenta 6/13 -> Instalando Nikto..."
git clone https://github.com/sullo/nikto.git
mv nikto toolbox-appsec/scanners

echo "[+] Ferramenta 7/13 -> Instalando OWASP ZAP..."
git clone https://github.com/zaproxy/zaproxy.git
mv zaproxy toolbox-appsec/scanners/zap

echo "[+] Ferramenta 8/13 -> Instalando XSStrike..."
git clone https://github.com/s0md3v/XSStrike ~/toolbox-appsec/scanners/XSStrike
sudo pip3 install -r toolbox-appsec/scanners/XSStrike/requirements.txt --break-system-packages

echo "[+] Ferramenta 9/13 -> Instalando Dirsearch..."
git clone https://github.com/maurosoria/dirsearch.git
mv dirsearch toolbox-appsec/fuzzing/

echo "[+] Ferramenta 10/13 -> Instalando Semgrep..."
sudo pip3 install semgrep --break-system-packages
ln -s $(which semgrep) toolbox-appsec/static-analysis/semgrep

echo "[+] Ferramenta 11/13 -> Instalando Bandit..."
sudo pip3 install bandit --break-system-packages
ln -s $(which bandit) toolbox-appsec/static-analysis/bandit

echo "[+] Ferramenta 12/13 -> Instalando Gitleaks..."
git clone https://github.com/gitleaks/gitleaks.git
mv gitleaks toolbox-appsec/utils/

echo "[+] Ferramenta 13/13 -> Instalando Trivy..."
git clone https://github.com/aquasecurity/trivy
mv trivy toolbox-appsec/utils/

echo "Atribuindo as permissões ao Docker"
sudo usermod -aG docker $USER
sudo usermod -aG sudo vboxuser

echo "[+] Instalação concluída com sucesso!"
echo "[!] Faça logout/login para aplicar permissões do Docker (ou use 'newgrp docker')"
