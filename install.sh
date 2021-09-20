#!/bin/bash

# Install pre-requisites
case $OSTYPE in
    darwin*)
        # Install HomeBrew (automatically installs Xcode CLT)
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        sudo chown -R $USER:admin /usr/local
        brew update
        brew install curl git
    ;;
    linux-gnu*)
        sudo apt install -y curl git
    ;;
esac

# checkout the repo
if [ -z "$SETUP_LOC" ]; then
  export SETUP_LOC="${HOME}/Desktop/.setup"
fi

if [ -n "${USE_GIT_URI}" ]; then
  GITHUB="git://github.com"
else
  GITHUB="https://github.com"
fi

echo $GITHUB
git clone --recurse-submodules "${GITHUB}/xavierosee/setup.git" "${SETUP_LOC}"


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

# zsh, OH-my-zsh & Powerlevel10k
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# git configuration
git config --global user.email "xrosee@live.cn"
git config --global user.name "Xavier Rosée"
sudo git config --system core.editor "vim"
gh auth login

# Install dotfiles
git clone --recurse-submodules https://github.com/xavierosee/dotfiles
mv dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install.sh

# Install Python (latest) and set as global environment
pyenv install $(pyenv install --list | grep -v - | grep -v rc | grep -v forge | tail -1)
pyenv global $(pyenv versions | tail -1)

# save the useful pictures
cp $SETUP_LOC/avatar.jpg ~/Pictures/
cp $SETUP_LOC/term_bg.jpg ~/Pictures/

# delete all installation files
rm -rf ~/.dotfiles
rm -rf $SETUP_LOC

echo "Congratulations! Your Cloudsdale setup is now over."
echo "This computer will restart in 30 seconds, just as a precaution"
sleep 30
sudo shutdown -r now
