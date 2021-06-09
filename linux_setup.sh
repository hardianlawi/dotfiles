#!/bin/bash
set -ex

setup_environment () {
    sudo apt update
    sudo apt install -y zsh rake wget git autojump \
        make gcc build-essential tmux g++ htop
    curl https://get.docker.com | bash
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

setup_jupyter () {
    jupyter notebook --generate-config

    pip install jupyter_contrib_nbextensions
    pip install jupyter_nbextensions_configurator
    pip install ipywidgets
    pip install ipykernel

    jupyter contrib nbextension install --user
    jupyter nbextension enable --py widgetsnbextension
    jupyter nbextension enable highlight_selected_word/main
    jupyter nbextension enable toc2/main
    jupyter nbextension enable codefolding/main
    jupyter nbextension enable collapsible_headings/main
    jupyter nbextension enable execute_time/ExecuteTime
}

setup_environment
customize_terminal
install_miniconda
