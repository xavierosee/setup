#!/bin/bash

# change hostname
hostnamectl set-hostname cloudsdale
hostnamectl set-hostname "Cloudsdale" --pretty

# upgrade everything
sudo apt update
sudo apt upgrade -y

# setup git & github
sudo apt install git -y
sudo snap install gh
git config --global user.email "xrosee@live.cn"
git config --global user.name "Xavier Rosée"
sudo git config --system core.editor "vim"
gh auth login

# setup basic dev tools
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git apt-transport-https ca-certificates software-properties-common
sudo snap install heroku --classic
sudo snap install code --classic

# Install VS Code extensions
code --installhostnamectl set-hostname new-hostname-extension ms-vscode.sublime-keybindings
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension ms-python.python
code --install-extension KevinRose.vsc-python-indent
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-python.anaconda-extension-pack
code --install-extension tlahmann.alex-linter
code --install-extension formulahendry.auto-close-tag
code --install-extension aaron-bond.better-comments
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension ms-dotnettools.csharp
code --install-extension deerawan.vscode-dash
code --install-extension unity.unity-debug
code --install-extension ms-azuretools.vscode-docker
code --install-extension rayhanw.erb-helpers
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-ceintl.vscode-language-pack-fr
code --install-extension eliostruyf.vscode-front-matter
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension jsynowiec.vscode-insertdatestring
code --install-extension dedsec727.jekyll-run
code --install-extension ginfuru.vscode-jekyll-snippets
code --install-extension ginfuru.ginfuru-vscode-jekyll-syntax
code --install-extension rohgarg.jekyll-post
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension kiteco.kite
code --install-extension sissel.shopify-liquid
code --install-extension bschulte.love
code --install-extension davidanson.vscode-markdownlint
code --install-extension sdras.night-owl
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension earshinov.permute-lines
code --install-extension pnp.polacode
code --install-extension esbenp.prettier-vscode
code --install-extension njpwerner.autodocstring
code --install-extension sbsnippets.pytorch-snippets
code --install-extension vense.rails-snippets
code --install-extension cyrusfirheir.twee3-language-tools
code --install-extension redhat.vscode-yaml


# zsh, OH-my-zsh & Powerlevel10k
sudo apt install -y zsh curl vim imagemagick jq
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp fonts ~/.fonts

# install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}

# Install Kite
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"

# Install Google Cloud CLI
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk google-cloud-sdk-app-engine-python

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.zshrc

# Install dotfiles
git clone --recurse-submodules https://github.com/xavierosee/dotfiles
mv dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install.sh
exec $SHELL

# Install pyenv
curl https://pyenv.run/ | bash

# Install Python (latest)
pyenv install $(pyenv install --list | grep -v - | grep -v rc | grep -v forge | tail -1)
