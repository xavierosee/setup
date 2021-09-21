#!/bin/bash

# change hostname
echo "Changing HostName"
hostnamectl set-hostname cloudsdale
hostnamectl set-hostname "Cloudsdale" --pretty
echo "HostName successfully changed"

# upgrade everything
echo "upgrading all packages"
sudo apt update
sudo apt upgrade -y
echo "packages successfully upgraded"

# setup basic dev tools
echo "installing basic dev tools"
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git apt-transport-https ca-certificates software-properties-common guake
sudo apt install -y zsh curl vim imagemagick jq
echo "installing heroku"
sudo snap install heroku --classic
echo "installing vscode"
sudo snap install code --classic
echo "installing github cli"
sudo snap install gh


# install fonts for PowerLevel10k
echo "installing Nerd Fonts"
rm -rf ~/.fonts
cp -r ~/.setup/ubuntu/fonts ~/.fonts
echo "Nerd Fonts successfully installed"

# install Docker
echo "installing docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
echo "Docker successfully installed"

# Install Kite
echo "installing Kite"
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
echo "Kite successfully installed"

# Install Google Cloud CLI
echo "installing Google Cloud CLI"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk google-cloud-sdk-app-engine-python
echo "Google Cloud Platform SDK successfully installed"

# Install NVM
echo "installing NVM"
rm - rf ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.zshrc
nvm install 14.17.6
nvm alias default node
echo "NVM successfully installed, default node set to latest node version on system"

# Install pyenv
rm -rf ~/.pyenv
curl https://pyenv.run/ | bash
echo "PyEnv successfully installed"

# Install various software and utilities
## First add the repositories
sudo add-apt-repository --yes ppa:maarten-fonville/android-studio
curl -s -o vpn.deb https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.debib && sudo dpkg -i vpn.deb && rm -rf vpn.deb
sudo add-apt-repository --yes ppa:alessandro-strada/ppa
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
 curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
 sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
 curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

## update software list
sudo apt update

## Then install the software
sudo apt install -y tree
sudo apt install -y mysql-client
sudo apt install -y postgresql-client
sudo apt install -y openjdk-11-jdk
echo "installing postman"
sudo snap install postman
echo "installing brave"
sudo snap install brave
sudo apt install -y speedtest-cli
sudo apt install -y protonvpn
echo "installing ferdi"
sudo snap install ferdi
sudo apt install -y 1password
echo "installing Apple Music"
sudo snap install apple-music-for-linux

### Google Drive sync
sudo apt install -y google-drive-ocamlfuse
rm -rf ~/.google-drive
mkdir ~/.google-drive
