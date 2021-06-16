#!/bin/bash
set -ex

. ./setup.sh

setup_environment () {
    # Latest NodeJs
    # https://github.com/nodesource/distributions
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

    sudo apt update
    sudo apt install -y zsh rake wget git autojump \
        make gcc build-essential tmux g++ htop nodejs

    curl https://get.docker.com | bash
}

setup_environment

# Remove password requirement
sudo sed s/required/sufficient/g -i /etc/pam.d/chsh

install_zsh
customize_terminal
install_miniconda "ubuntu"
setup_jupyter
