# setup

A repository with all the initial tools I need upon installing a new laptop.
I have two different scripts for mac and linux, as I use different OS on my home and work laptops.

Inspired by [David Leuliette's](https://github.com/flexbox) and [Preslav Mihaylov](https://github.com/preslavmihaylov) similar repositories.

## Usage

### Pre-requisites

You need to have `cURL` installed to install everything, so :

- **if you're on macOS**, it's already installed by default

- **if you're on Linux** :

    ```bash
    sudo apt install curl
    ```

### Install

```bash
curl -L https://raw.githubusercontent.com/xavierosee/setup/main/install.sh | bash
```

Your computer should restart once at the end of the whole process.

After restarting, upon opening your terminal :

```bash
chsh -s $(which zsh)
```

which should run you through the PowerLevel10k setup process.
If not :

```bash
p10k configure
```

#### [LINUX] Setting up Node and Python

After the reboot and the p10k setup, NVM and PyEnv should be in your $PATH, so you can run:

```bash
nvm install $(nvm ls-remote | grep Latest | tail -1)
nvm alias default node

pyenv install $(pyenv install --list | grep -v - | grep -v rc | grep -v forge | tail -1)
pyenv global $(pyenv versions | tail -1)

```

#### [[LINUX]Google Drive sync

To enable the Google Drive daemon, run this command once:

```bash
google-drive-ocamlfuse ~/.google-drive
```

And you're set! :tada:

## Comments and feedback

If you have any suggestion for optimizing this, feel free to submit a PR 😃
