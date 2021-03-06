#!/bin/bash
set -ex

set_git_config () {
    git config --global user.name hardianlawi
    git config --global user.email hardianlawi@gmail.com
}

update_zshrc () {
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' $HOME/.zshrc
    sed -i 's/plugins=(git)/plugins=(autojump git history z zsh-autosuggestions kubectl)/g' $HOME/.zshrc

    echo "" >> $HOME/.zshrc
    echo "code () { VSCODE_CWD="\$PWD" open -n -b "com.microsoft.VSCode" --args \$* ;}" >> $HOME/.zshrc
    echo "" >> $HOME/.zshrc
}

install_zsh () {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

customize_terminal () {
    # https://github.com/carlhuda/janus
    curl -L https://bit.ly/janus-bootstrap | bash

    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    update_zshrc

    source $HOME/.zshrc
}

install_miniconda () {
    PREFIX="https://github.com/conda-forge/miniforge/releases/latest/download/"
    if [[ "$1" == "mac" ]]
    then
        FILE="Miniforge3-MacOSX-arm64.sh"
    elif [[ "$1" == "ubuntu" ]]
    then
        FILE="Miniforge3-Linux-x86_64.sh"
    else
        exit 1
    fi

    if ! command -v conda &> /dev/null
    then
        echo "Installing miniconda..."
        wget ${PREFIX}${FILE}
        bash ${FILE}
        rm ${FILE}
        echo "Running `conda config --set changeps1 False` to turn off the conda environment display"
    fi

    source $HOME/.zshrc
}

setup_jupyter () {
    # Jupyter Notebook
    pip install jupyter
    pip install jupyter_contrib_nbextensions
    pip install jupyter_nbextensions_configurator
    pip install ipywidgets
    pip install ipykernel
    pip install jupytext
    pip install papermill

    jupyter notebook --generate-config
    jupyter contrib nbextension install --user
    jupyter nbextension enable --py widgetsnbextension
    jupyter nbextension enable highlight_selected_word/main
    jupyter nbextension enable toc2/main
    jupyter nbextension enable codefolding/main
    jupyter nbextension enable collapsible_headings/main
    jupyter nbextension enable execute_time/ExecuteTime
    
    # https://stackoverflow.com/a/61784882
    jupyter labextension install jupyterlab-plotly
    jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget
    jupyter labextension install @ryantam626/jupyterlab_code_formatter
    
    # Jupyter Lab
    pip install jupyterlab

    # https://github.com/krassowski/jupyterlab-lsp
    pip install jupyterlab-lsp
    pip install 'python-lsp-server[all]'

    jupyter labextension install jupyterlab-drawio --no-build
    jupyter labextension install @jupyterlab/toc --no-build
    jupyter labextension install @jupyterlab/debugger --no-build
    jupyter labextension install jupyterlab-topbar-extension --no-build
    jupyter labextension install jupyterlab-spreadsheet --no-build

    # jupyter labextension install @wallneradam/trailing_space_remover
    # jupyter labextension install jupyterlab-execute-time

    jupyter lab build
}
