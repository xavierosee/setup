#!/bin/bash

# change hostname
hostnamectl set-hostname cloudsdale
hostnamectl set-hostname "Cloudsdale" --pretty

# upgrade everything
sudo apt update
sudo apt upgrade -y

# setup basic dev tools
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git apt-transport-https ca-certificates software-properties-common
sudo apt install -y zsh curl vim imagemagick jq
sudo snap install heroku --classic
sudo snap install code --classic
sudo snap install gh

# install fonts for PowerLevel10k
cp fonts ~/.fonts
echo "Nerd Fonts successfully installed"

# install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
echo "Docker successfully installed"

# Install Kite
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
echo "Kite successfully installed"

# Install Google Cloud CLI
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk google-cloud-sdk-app-engine-python
echo "Google Cloud Platform SDK successfully installed"

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.zshrc
echo "NVM successfully installed"

# Install pyenv
curl https://pyenv.run/ | bash
echo "PyEnv successfully installed"

# Install various software and utilities
## First add the repositories
sudo add-apt-repository --yes ppa:maarten-fonville/android-studio
curl -s -o vpn.deb https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb && sudo dpkg -i vpn.deb && rm -rf vpn.deb
sudo add-apt-repository --yes ppa:alessandro-strada/ppa
sudo apt update
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg


## Then install the software
sudo apt install -y tree
sudo apt install -y mysql-client
sudo apt install -y postgresql-client
sudo apt install -y openjdk-11-jdk
sudo snap install postman
sudo snap install brave
sudo apt install -y speedtest-cli
sudo apt install -y protonvpn
sudo snap install ferdi
sudo apt install 1password

### Google Drive sync
sudo apt install -y google-drive-ocamlfuse
google-drive-ocamlfuse
mkdir ~/.google-drive
google-drive-ocamlfuse ~/.google-drive
