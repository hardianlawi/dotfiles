#!/bin/bash
set -ex

install_miniconda () {
    if ! command -v conda &> /dev/null
    then
        echo "Installing miniconda..."
        wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
        bash Miniforge3-MacOSX-arm64.sh
        rm Miniforge3-MacOSX-arm64.sh
        echo "Please run `conda config --set changeps1 True` to turn off the conda environment display"
    fi
}

customize_terminal () {

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # https://github.com/carlhuda/janus
    curl -L https://bit.ly/janus-bootstrap | bash
}

install_miniconda
customize_terminal