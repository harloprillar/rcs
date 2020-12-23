#!/bin/bash -e
#
# Install common terminal programs configurations.
# Require packages installed before run: VIM, curl

# Uncomment to install packages
# CMD=$(which yum || which apt-get)
# $CMD install -qy yamllint git wget curl vim vim-nox

# Install rc configs
for f in .bashrc .vimrc .screenrc .inputrc .config/yamllint/config; do 
  curl -fsLo ~/$f --create-dirs https://raw.githubusercontent.com/harloprillar/rcs/master/home/$f
done;

# Add VIM plugin manager 
curl -fsLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Disable incompatible plugins for VIM version < 8
vim --version | head -1 | grep -q 'IMproved 7' && sed -ri 's/(.*Plug.+sheerun\/vim-polyglot.*)/"\1/' ~/.vimrc
vim --version | head -1 | grep -q 'IMproved 7' && sed -ri 's/(.*Plug.+dense-analysis\/ale.*)/"\1/' ~/.vimrc

# Install VIM plugins
vim +PlugInstall +qall > /dev/null 2>&1

