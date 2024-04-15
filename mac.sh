#!/bin/bash
set -ex

. ./setup.sh

setup_brew () {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/hardianlawi/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

setup_environment () {
    setup_brew

    brew install golang
    brew install git
    brew install wget
    brew install node
    brew install macvim
    brew install autojump
    brew install pre-commit
    brew install thefuck
    brew install tmux
    brew install git-lfs

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
    brew install --cask anki
    brew install --cask whatsapp
}

setup_environment
# install_applications
install_zsh
customize_terminal
install_miniconda "mac"

# https://superuser.com/questions/670252/cmdtab-app-switcher-is-on-the-wrong-monitor
# TODO: Find better solution
defaults write com.apple.dock appswitcher-all-displays -bool true
killall Dock
