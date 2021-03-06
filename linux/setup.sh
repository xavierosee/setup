#!/bin/bash

# change hostname
echo " ##### Changing HostName ##### "
hostnamectl set-hostname xavierosee
hostnamectl set-hostname "Xavier's Laptop" --pretty
echo " ##### HostName successfully changed ##### "

# upgrade everything
echo " ##### upgrading all packages ##### "
sudo apt update
sudo apt upgrade -y
echo " ##### packages successfully upgraded ##### "

# setup basic dev tools
echo " ##### installing basic dev tools ##### "
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git apt-transport-https ca-certificates software-properties-common guake snapd zsh vim imagemagick jq
echo " ##### installing heroku ##### "
sudo snap install heroku --classic
echo " ##### installing github cli ##### "
sudo snap install gh


# install Nerd fonts
echo " ##### installing Nerd Fonts ##### "
mv ~/.fonts /tmp
cp -r ~/workspace/xavierosee/setup/linux/fonts ~/.fonts
echo " ##### Nerd Fonts successfully installed ##### "

# install Docker
echo " ##### installing docker ##### "
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo usermod -aG docker ${USER}
echo " ##### Docker successfully installed ##### "

# Install pyenv
mv ~/.pyenv /tmp
curl https://pyenv.run/ | bash
echo " ##### PyEnv successfully installed ##### "

# Install various software and utilities
## First add the repositories
### sudo apt-key add ./Repo.keys
### sudo cp -R ./sources.list* /etc/apt/
sudo add-apt-repository --yes ppa:maarten-fonville/android-studio
sudo add-apt-repository --yes ppa:alessandro-strada/ppa
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
 curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
 sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
 curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O dotnet.deb && sudo dpkg -i dotnet.deb && rm dotnet.deb
sudo add-apt-repository ppa:atareao/telegram
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
sudo add-apt-repository ppa:aos1/diff-so-fancy
sudo add-apt-repository ppa:neovim-ppa/stable 
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa


## update software list
sudo apt update

## Then install the software
sudo apt install -y dselect tree ack mysql-client postgresql-client openjdk-11-jdk dotnet-sdk-5.0 firefox-trunk speedtest-cli 1password telegram signal-desktop zeal virtualbox virtualbox-dkms linux-headers-generic vagrant pipewire libspa-0.2-bluetooth pipewire-audio-client-libraries prettyping htop diff-so-fancy fortune-mod guake ripgrep linux-firmware neovim python3-neovim golang vim-python-jedi pv
echo " ##### installing postman ##### "
sudo snap install postman
echo " ##### installing Apple Music ##### "
sudo snap install apple-music-for-linux

wget https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb && dpkg -i bat_*.deb && mv bat_*.deb /tmp

### Google Drive sync
sudo apt install -y google-drive-ocamlfuse
mv ~/.google-drive /tmp
mkdir ~/.google-drive

systemctl --user --now enable pipewire-media-session.service
systemctl --user restart pipewire

sudo dselect update
sudo dpkg --set-selections < ./Packages.list
sudo apt-get dselect-upgrade -y
