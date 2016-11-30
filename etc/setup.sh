#!/bin/bash

DOT_PATH=$HOME/dotfiles

#generals
DOT_FILES=(.vimrc .bashrc .zshenv .zshrc .gitconfig .Xmodmap .xinitrc .xinputrc .aliases)
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

#i3 dotfiles
ln -s $DOT_PATH/i3 $HOME/.config/
ln -s $DOT_PATH/bin $HOME/

#atom
if [ -d $HOME/.atom ];then
  SETTING_FILES=(atom-packages comfig.cson terminal-commands.json)
  
  for TARGET in ${SETTING_FILES[@]}
  do
    ln -s $DOT_PATH/atom/$TARGET $HOME/.atom/
  done
fi
