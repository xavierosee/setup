#!/bin/bash

# Install pre-requisites
echo "Installing required packages"
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
echo "Required packages successfully installed"

# checkout the repo
if [ -z "$SETUP_LOC" ]; then
  export SETUP_LOC="${HOME}/.setup"
fi

if [ -n "${USE_GIT_URI}" ]; then
  GITHUB="git://github.com"
else
  GITHUB="https://github.com"
fi

echo "Cloning the repo"
git clone --recurse-submodules "${GITHUB}/xavierosee/setup.git" "${SETUP_LOC}"
echo "Repo cloned to ~/.setup/"


# Run OS-specific commands
case $OSTYPE in
    darwin*)
        sh $SETUP_LOC/macOS/setup.sh
    ;;
    linux-gnu*)
        sh $SETUP_LOC/ubuntu/setup.sh
    ;;
esac

# Install VS Code extensions
echo "Installing VS Code extensions"
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
echo "VSCode Extensions installed"

# zsh, OH-my-zsh & Powerlevel10k
rm -rf ~/.oh-my-zsh
echo "Installing oh)my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "oh-my-zsh installed, now cloning p10k and plugins"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# git configuration
echo "configuring git"
git config --global user.email "xrosee@live.cn"
git config --global user.name "Xavier Rosée"
sudo git config --system core.editor "vim"
echo "git configured, do not forget to gh auth login at the end of all this"

# Install dotfiles
echo "installing dotfiles"
git clone --recurse-submodules https://github.com/xavierosee/dotfiles
mv dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install.sh

# Install Python (latest) and set as global environment
echo "installing latest Python version"
pyenv install $(pyenv install --list | grep -v - | grep -v rc | grep -v forge | tail -1)
echo "setting this version as global virtualenv"
pyenv global $(pyenv versions | tail -1)

# save the useful pictures
echo "saving pictures to the Pictures folder"
cp $SETUP_LOC/avatar.jpg ~/Pictures/
cp $SETUP_LOC/term_bg.jpg ~/Pictures/

# delete all installation files
echo "cleaning up..."
rm -rf ~/.dotfiles
rm -rf $SETUP_LOC

echo "Congratulations! Your Cloudsdale setup is now over."
echo "This computer will restart in 60 seconds, just as a precaution"
sudo shutdown -r +1
