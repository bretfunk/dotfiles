#!/bin/bash

ln -s -f ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s -f ~/dotfiles/coc-settings ~/.config/nvim/coc-settings.json
ln -s -f ~/dotfiles/kitty ~/.config/kitty/kitty.conf
ln -s -f ~/dotfiles/bashrc ~/.bashrc
ln -s -f ~/dotfiles/zshrc ~/.zshrc
ln -s -f ~/dotfiles/gitignore ~/.gitignore
ln -s -f ~/dotfiles/hammerspoon.lua ~/.hammerspoon/init.lua

# only push to github if main computer
COMP=$(scutil --get ComputerName)
if [ "$COMP" == "tomcat" ]
  then
  git add .
  git commit -m "Updated on $(date)"
  git push
fi
