#!/bin/bash

# Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install stow
brew update && brew install stow

# pull latest changes
git pull origin master

# symlink files
stow .
