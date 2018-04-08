#!/bin/bash
echo -n backing up existing .vimrc..
mv ~/.vimrc ~/.vimrc.backup.$(date +"%s")
echo "source ~/dotfiles/vim/vimrc" > ~/.vimrc
echo " [COMPLETE]"

echo -n backing up existing .tmux.conf..
mv ~/.tmux.conf ~/.tmux.conf.$(date +"%s")
echo "source-file ~/dotfiles/tmux/tmux.conf" > ~/.tmux.conf
echo " [COMPLETE]"
