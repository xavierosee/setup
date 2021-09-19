#!/bin/bash

# Install HomeBrew (automatically installs Xcode CLT)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo chown -R $USER:admin /usr/local
brew update

# Install software
## dev & data stuff
brew install git
brew install gh
brew install pyenv
brew install pyenv-virtualenv
brew install docker
brew install heroku
brew install --cask kite
brew install mysql
brew install node
brew install nvm
brew install postgresql
brew install wget
brew install imagemagick
brew install jq
brew install tree
brew install openssl
brew install ncdu
brew install xz
brew install readline
brew install --cask visual-studio-code
brew install --cask adoptopenjdk
brew install --cask android-studio
brew install --cask arduino
brew install --cask blender
brew install --cask dotnet-sdk
brew install --cask figma
brew install --cask origami-studio
brew install --cask postman
brew install --cask twine
brew install --cask unity

## other & personal stuff
brew install exiftool
brew install firefox
brew install --cask brave-browser
brew install speedtest-cli
brew install --cask bartender
brew install --cask calibre
brew install --cask deckset
brew install --cask discord
brew install --cask dropbox
brew install --cask duet
brew install --cask fliqlo
brew install --cask godot
brew install --cask google-cloud-sdk
brew install --cask iterm2
brew install --cask microsoft-auto-update
brew install --cask microsoft-office
brew install --cask microsoft-teams
brew install --cask mmhmm
brew install --cask notion
brew install --cask plex
brew install --cask protonvpn
brew install --cask sidequest
brew install --cask signal
brew instal --cask teamviewer
brew install --cask zoom
brew install --cask slack
brew install --cask whatsapp
brew install --cask telegram
brew install mas

# Install macOS App Store apps
mas install 1278508951 # Trello
mas install 824183456 # Affinity Photo
mas install 824171161 # Affinity Designer
mas install 1333542190 # 1Password
mas install 1449412482 # Reeder
mas install 682658836 # GarageBand
mas install 497799835 # Xcode
mas install 417375580 # BetterSnapTool
mas install 1489704689 # Moleskine Journey
mas install 1289197285 # MindNote
mas install 425955336 # Skitch
mas install 409183694 # Keynote
mas install 775737590 # IA Writer
mas install 1091189122 # Bear

# Install VS Code extensions
code --install-extension ms-vscode.sublime-keybindings
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

# Install Python (latest stable)
pyenv install $(pyenv install --list | grep -v - | grep -v rc | grep -v forge | tail -1)

# OH-my-zsh & Powerlevel10k
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# git configuration
git config --global user.email "xrosee@live.cn"
git config --global user.name "Xavier Rosée"
sudo git config --system core.editor "vim"

# setup Mac name
sudo scutil --set HostName Cloudsdale
sudo scutil --set LocalHostName Cloudsdale
sudo scutil --set ComputerName Cloudsdale

# setup key repeating
defaults write -g ApplePressAndHoldEnabled -bool false

# 'disable' dock
defaults write com.apple.dock tilesize -int 1
killall Dock

# install dotfiles
git clone --recurse-submodules https://github.com/xavierosee/dotfiles
mv dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install.sh
