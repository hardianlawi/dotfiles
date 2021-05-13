ZSH_THEME="spaceship"

plugins=(autojump git history z zsh-autosuggestions kubectl)

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}