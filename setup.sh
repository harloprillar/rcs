#!/bin/bash -e

CMD=$(which yum || which apt-get)
$CMD install -y yamllint git wget curl

for f in .bashrc .vimrc .screenrc .inputrc .config/yamllint/config; do 
	wget https://raw.githubusercontent.com/harloprillar/rcs/master/home/$f -O ~/$f 
done;

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

