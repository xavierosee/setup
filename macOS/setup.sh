#!/bin/bash

# setup Mac name
sudo scutil --set HostName cloudsdale
sudo scutil --set LocalHostName cloudsdale
sudo scutil --set ComputerName cloudsdale

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

# setup key repeating
defaults write -g ApplePressAndHoldEnabled -bool false

#change Screenshot saving folder
mkdir ${HOME}/screenshots
defaults write com.apple.screencapture location ${HOME}/screenshots

# 'disable' dock
defaults write com.apple.dock tilesize -int 1
killall Dock
