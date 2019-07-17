#!/bin/sh

ln -sf ~/.config/.zshrc ~/.zshrc
ln -sf ~/.config/.vimrc ~/.vimrc
ln -sf ~/.config/personal.zsh-theme ~/.oh-my-zsh/custom/themes/personal.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc
