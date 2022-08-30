#!/bin/bash

# setup Mac name
sudo scutil --set HostName cloudsdale
sudo scutil --set LocalHostName cloudsdale
sudo scutil --set ComputerName cloudsdale

# Install software
## dev & data stuff
brew install pyenv
brew install pyenv-virtualenv
brew install docker
brew install heroku
brew install nvm
brew install wget
brew install imagemagick
brew install jq
brew install tree
brew install openssl
brew install ncdu
brew install xz
brew install readline
brew install --cask adoptopenjdk
brew install --cask android-studio
brew install --cask arduino
brew install --cask blender
brew install --cask dotnet-sdk
brew install --cask origami-studio
brew install --cask postman
brew install --cask twine

## other & personal stuff
brew install exiftool
brew install mas
brew install speedtest-cli
brew install --cask 1password
brew install --cask calibre
brew install --cask deckset
brew install --cask discord
brew install --cask dropbox
brew install --cask fliqlo
brew install --cask google-cloud-sdk
brew install --cask iterm2
brew install --cask mmhmm
brew install --cask notion
brew install --cask plex
brew install --cask protonvpn
brew install --cask sidequest
brew install --cask signal
brew install --cask slack
brew install --cask teamviewer
brew install --cask telegram
brew install --cask whatsapp
brew install --cask zoom

# Install macOS App Store apps
mas install 824183456 # Affinity Photo
mas install 824171161 # Affinity Designer
mas install 682658836 # GarageBand
mas install 497799835 # Xcode
mas install 417375580 # BetterSnapTool
mas install 1289197285 # MindNode
mas install 425955336 # Skitch
mas install 409183694 # Keynote
mas install 775737590 # IA Writer

# setup key repeating
defaults write -g ApplePressAndHoldEnabled -bool false

# change Screenshot saving folder
mkdir ${HOME}/screenshots
defaults write com.apple.screencapture location ${HOME}/screenshots

# 'disable' dock
defaults write com.apple.dock tilesize -int 1
killall Dock
