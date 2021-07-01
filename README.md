# dotfiles

Helpful links:

- https://github.com/mathiasbynens/dotfiles contains lots of macOS defaults
- https://github.com/webpro/dotfiles has clean dotfiles structure using Makefiles

For Ubuntu,

```bash
sudo sed s/required/sufficient/g -i /etc/pam.d/chsh
chsh -s $(which zsh)
bash ubuntu.sh
```

For Mac,

```bash
chsh -s $(which zsh)
bash mac.sh
```

After restarting your terminal,

```bash
conda config --set changeps1 False
bash setup.sh && setup_jupyter
```
