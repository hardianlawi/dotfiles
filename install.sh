#!/bin/bash
set -ex

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask
brew tap homebrew/cask-versions

brew install git
brew install curl
brew install wget
brew install mas
brew install node
brew install macvim
brew install autojump

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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

# Install Focus-To-Do
mas install 1258530160

# Install OneDrive
mas install 823766827

if ! command -v conda &> /dev/null
then
    echo "Installing miniconda..."
    wget https://github.com/conda-forge/miniforge/releases/download/4.10.0-0/Mambaforge-MacOSX-arm64.sh
    bash Mambaforge-MacOSX-arm64.sh
    rm Mambaforge-MacOSX-arm64.sh
    echo "Please run `conda config --set changeps1 True` to turn off the conda environment display"
fi

# https://github.com/carlhuda/janus
curl -L https://bit.ly/janus-bootstrap | bash
