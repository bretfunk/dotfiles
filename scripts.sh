#!/bin/bash

rm ~/.config/nvim/init.vim
rm ~/.config/nvim/coc-settings.json
rm ~/.config/kitty/kitty.conf
rm ~/.bashrc
rm ~/.zshrc
rm ~/.gitignore

ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/coc-settings ~/.config/nvim/coc-settings.json
ln -s ~/dotfiles/kitty ~/.config/kitty/kitty.conf
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gitignore ~/.gitignore

# only push to github if main computer
COMP=$(scutil --get ComputerName)
if [ "$COMP" == "tomcat" ]
  then
  git add .
  git commit -m "Updated on $(date)"
  git push
fi
