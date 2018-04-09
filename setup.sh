#!/bin/bash
echo backing up existing ~/.config/nvim/init.vim..
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.$(date +"%s")
echo backing up existing .vimrc..
mv ~/.vimrc ~/.vimrc.backup.$(date +"%s")
echo "source ~/dotfiles/vim/vimrc" > ~/.vimrc
mkdir -p ~/.config/nvim
echo "source ~/.vimrc" > ~/.config/nvim/init.vim

echo backing up existing .tmux.conf..
mv ~/.tmux.conf ~/.tmux.conf.$(date +"%s")
echo "source-file ~/dotfiles/tmux/tmux.conf" > ~/.tmux.conf

echo backing up existing ~/.zshrc..
mv ~/.zshrc ~/.zshrc.$(date +"%s")
echo "source ~/dotfiles/zsh/zshrc" > ~/.zshrc
