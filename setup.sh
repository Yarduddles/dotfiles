#!/bin/bash
echo -n copying .vimrc..
mv ~/.vimrc ~/.vimrc.backup.$(date +"%s")
echo "source ~/dotfiles/vim/.vimrc" > ~/.vimrc
echo " [COMPLETE]"

echo -n copying .tmux.conf..
mv ~/.tmux.conf ~/.tmux.conf.$(date +"%s")
cp -f ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
echo " [COMPLETE]"
