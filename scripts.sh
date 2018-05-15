#!/bin/bash

rm ~/.vim/vimrc
rm ~/.bashrc
rm ~/.zshrc
rm ~/.gitignore

ln -s ~/dotfiles/vimrc ~/.vim/vimrc
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gitignore ~/.gitignore
