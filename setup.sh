#!/bin/bash
echo backing up existing ~/.config/nvim/init.vim..
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.$(date +"%s")
echo backing up existing .vimrc..
mv ~/.vimrc ~/.vimrc.backup.$(date +"%s")
echo "source $PWD/vim/vimrc" > ~/.vimrc
mkdir -p ~/.config/nvim
echo "source ~/.vimrc" > ~/.config/nvim/init.vim

echo backing up existing .tmux.conf..
mv ~/.tmux.conf ~/.tmux.conf.backup.$(date +"%s")
echo "source-file $PWD/tmux/tmux.conf" > ~/.tmux.conf

echo backing up existing ~/.zshrc..
mv ~/.zshrc ~/.zshrc.backup.$(date +"%s")
echo "source $PWD/zsh/zshrc" > ~/.zshrc

echo removing backups..
rm ~/.zshrc.backup.* ~/.vimrc.backup.* ~/.tmux.conf.backup.*
