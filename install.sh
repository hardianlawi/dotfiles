#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap caskroom/cask
brew tap caskroom/versions

brew install git
brew install curl
brew install wget
brew install mas
brew install node
brew install macvim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install --cask brave-browser
brew install --cask alfred
brew install --cask rectangle
brew install --cask franz
brew install --cask spotify
brew install --cask sublime-text3
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask notion
brew install --cask slack

# Install Focus-To-Do
mas install 1258530160

# Install OneDrive
mas install 823766827

if ! command -v conda &> /dev/null
then
    bash Miniconda3-latest-MacOSX-x86_64.sh
fi

# https://github.com/carlhuda/janus
curl -L https://bit.ly/janus-bootstrap | bash
