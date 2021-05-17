#/bin/bash
set -ex

# Save screenshots to the Downloads
defaults write com.apple.screencapture location -string "$HOME/Downloads"

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true