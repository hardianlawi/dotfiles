#!/bin/bash
set -ex

setup_environment () {
    sudo apt update
    sudo apt install -y zsh rake wget git autojump
}

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

update_zshrc () {

    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' $HOME/.zshrc
    sed -i 's/plugins=(git)/plugins=(autojump git history z zsh-autosuggestions kubectl)/g' $HOME/.zshrc

    echo "" >> $HOME/.zshrc
    echo "\ncode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}\n" >> $HOME/.zshrc
    echo "" >> $HOME/.zshrc

}

customize_terminal () {

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    update_zshrc

    source $HOME/.zshrc

    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # https://github.com/carlhuda/janus
    curl -L https://bit.ly/janus-bootstrap | bash
}

setup_environment
install_miniconda
customize_terminal