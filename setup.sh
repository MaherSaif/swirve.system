#!/bin/zsh

echo "Enter the directory where infinitered dotfiles is located: "
read directory 

ln -s ./vimrc.local ~/vimrc.local 
ln -s ./zshrc ~/.zshrc 
ln -s ./zshrc.cmdprompt ~/.zshrc.cmdprompt 
ln -s $directory/etc/vim/gvimrc ~/.gvimrc 
ln -s $directory/etc/vim ~/.vim 
mv ./ir_black.vim $directory/etc/vim/colors/ir_black.vim
