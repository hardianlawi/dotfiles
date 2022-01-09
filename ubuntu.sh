#!/bin/bash
set -ex

. ./setup.sh

setup_environment () {
    # Latest NodeJs
    # https://github.com/nodesource/distributions
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

    # To get latest version of git
    sudo add-apt-repository ppa:git-core/ppa -y
    
    sudo apt update
    sudo apt install -y zsh rake wget autojump \
        make gcc build-essential tmux g++ htop nodejs \
        git git-lfs

    set_git_config

    curl https://get.docker.com | bash

    ssh-keygen -t rsa -b 4096 -C "hardianlawi@gmail.com"
}

setup_environment
install_zsh
customize_terminal
install_miniconda "ubuntu"
