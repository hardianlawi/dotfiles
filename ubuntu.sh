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

    set_git_config

    curl https://get.docker.com | bash

    ssh-keygen -t rsa -b 4096 -C "hardianlawi@gmail.com"
}

setup_environment
install_zsh
customize_terminal
install_miniconda "ubuntu"
