#!/bin/bash

rm ~/.config/nvim/init.vim
rm ~/.config/nvim/coc-settings.json
rm ~/.bashrc
rm ~/.zshrc
rm ~/.gitignore

ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/coc-settings ~/.config/nvim/coc-settings.json
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gitignore ~/.gitignore

COMP=$(scutil --get ComputerName)
echo $COMP
# echo $(scutil --get ComputerName)

# computerName=$(scutil --get ComputerName)

if [ "$COMP" == "Bret’s MacBook Pro" ]
  then
  git add .
  git commit -m "Updated on $(date)"
  git push
  echo "Gitting complete"
fi
