#!/bin/bash
set -ex

. ./setup.sh

setup_environment () {
    sudo apt update
    sudo apt install -y zsh rake wget git autojump \
        make gcc build-essential tmux g++ htop
    curl https://get.docker.com | bash
}

setup_environment
customize_terminal
install_miniconda "ubuntu"
setup_jupyter
