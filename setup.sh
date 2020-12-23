#!/bin/bash -e
#
# Install common terminal programs configurations.
# Require packages installed before run: VIM, curl

# Uncomment to install packages
# CMD=$(which yum || which apt-get)
# $CMD install -qy yamllint git wget curl vim vim-nox

for f in .bashrc .vimrc .screenrc .inputrc .config/yamllint/config; do 
  curl -fsLo ~/$f --create-dirs https://raw.githubusercontent.com/harloprillar/rcs/master/home/$f
done;

curl -fsLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Disable "vim-polyglot" VIM plugin for VIM versions < 8 bacause of error
vim --version | head -1 | grep -q 'IMproved 7' && sed -ri 's/(.*Plug.+vim-polyglot.*)/"\1/' ~/.vimrc
vim +PlugInstall +qall > /dev/null 2>&1

