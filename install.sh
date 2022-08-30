#!/bin/bash

# Install pre-requisites
echo " ##### Installing required packages ##### "
case $OSTYPE in
    darwin*)
        # Install HomeBrew (automatically installs Xcode CLT)
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        sudo chown -R $USER:admin /usr/local
        brew update
        brew install git
    ;;
    linux-gnu*)
        sudo apt install -y git
    ;;
esac
echo " ##### Required packages successfully installed ##### "

# checkout the repo
if [ -z "$SETUP_LOC" ]; then
  export SETUP_LOC="${HOME}/workspace/xavierosee/setup"
fi

if [ -n "${USE_GIT_URI}" ]; then
  GITHUB="git://github.com"
else
  GITHUB="https://github.com"
fi

echo " #####  Cloning the repo ##### "
git clone --recurse-submodules "${GITHUB}/xavierosee/setup.git" "${SETUP_LOC}"
echo " #####  Repo cloned to ~/.setup/ ##### "


# Run OS-specific commands
case $OSTYPE in
    darwin*)
        sh $SETUP_LOC/macOS/setup.sh
    ;;
    linux-gnu*)
        sh $SETUP_LOC/linux/setup.sh
    ;;
esac

# git configuration
echo " #####  configuring git  ##### "
git config --global user.email "xrosee@live.cn"
git config --global user.name "Xavier Rosée"
sudo git config --system core.editor "vim"
echo " ##### git configured ##### "

# Install dotfiles
echo " ##### installing dotfiles ##### "
git clone --recurse-submodules https://github.com/xavierosee/dotfiles
mv dotfiles ~/workspace/xavierosee/dotfiles
cd ~/workspace/xavierosee/dotfiles && ./install.sh

# Install Plug for nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Python (latest) and set as global environment (only on mac)
case $OSTYPE in
    darwin*)
        echo " ##### installing latest Python version ##### "
        pyenv install $(pyenv install --list | grep -v - | grep -v rc | grep -v forge | grep -v a | tail -1)
        echo " ##### setting this version as global virtualenv ##### "
        pyenv global $(pyenv versions | tail -1)
    ;;
esac

# save the useful pictures
echo " ##### saving pictures to the Pictures folder ##### "
cp $SETUP_LOC/avatar.jpg $HOME/Pictures/
cp $SETUP_LOC/term_bg.jpg $HOME/.local/share/backgrounds/fluttershy_bg.jpg
cp $SETUP_LOC/term_bg.jpg $HOME/Pictures/fluttershy_bg.jpg

# set Linux system prefs
case $OSTYPE in
    linux-gnu*)
        sh $SETUP_LOC/linux/prefs.sh
    ;;
esac

echo " ##### Congratulations! Your setup is now over. ##### "
echo " ##### This computer will restart in 60 seconds, just as a precaution ##### "
sudo shutdown -r +1
