#!/bin/bash
mv ~/.vimrc ~/.vimrc.backup.$(date +"%s")
echo "source ~/dotfiles/vim/.vimrc" > ~/.vimrc

mv ~/.tmux.conf ~/.tmux.conf.$(date +"%s")
cp -f ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
