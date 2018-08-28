#!/bin/bash
sudo apt-get update
sudo apt-get install openssh-server openssh-client git cscope ctags clipit 
cd

echo 'git clone ssh://git@123.57.39.115/ini.git'
echo -n 'yes or no'
read cmd
git clone ssh://git@123.57.39.115/ini.git

echo 'git clone ssh://git@123.57.39.115/bin.git'
echo -n 'yes or no'
read cmd
git clone ssh://git@123.57.39.115/bin.git

mv .bashrc .bashrc.ori
ln -s ini/bashrc .bashrc

ln -s ini/vim .vim
ln -s ini/vimrc .vimrc

. .bashrc

