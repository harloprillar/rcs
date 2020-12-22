#!/bin/bash -e

CMD=$(which yum || which apt-get)
$CMD install -qy yamllint git wget curl

for f in .bashrc .vimrc .screenrc .inputrc .config/yamllint/config; do 
  curl -fsLo ~/$f --create-dirs https://raw.githubusercontent.com/harloprillar/rcs/master/home/$f
done;

curl -fsLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -E -s +PlugInstall +visual +qall

