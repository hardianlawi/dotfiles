#!/bin/bash
set -ex

. ./setup.sh

setup_brew () {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap homebrew/cask
    brew tap homebrew/cask-versions
}

setup_environment () {
    setup_brew

    brew install golang
    brew install git
    brew install curl
    brew install wget
    brew install mas
    brew install node
    brew install macvim
    brew install autojump
    brew install pre-commit
    brew install thefuck
    brew install tmux

    set_git_config
}

install_applications () {
    brew install --cask brave-browser
    brew install --cask alfred
    brew install --cask rectangle
    brew install --cask franz
    brew install --cask spotify
    brew install --cask sublime-text
    brew install --cask iterm2
    brew install --cask visual-studio-code
    brew install --cask notion
    brew install --cask slack
    brew install --cask docker
    brew install --cask selfcontrol
    brew install --cask trader-workstation
    brew install --cask zoom
    brew install --cask wechat
    brew install --cask anki
    brew install --cask whatsapp

    # Install Focus-To-Do
    mas install 1258530160

    # Install OneDrive
    mas install 823766827

    # Install OneNote
    mas install 784801555
}

setup_environment
install_applications
install_zsh
customize_terminal
install_miniconda "mac"
