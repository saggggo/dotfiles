#!/bin/bash
DOTPATH=${DOTPATH:-$HOME/dotfiles}

# dotfiles link
while read line; do
    ln -s $HOME/dotfiles/$line $HOME/$line
done < ${DOTPATH}/etc/homefiles

# githooks
mkdir -p $DOTPATH/.git/hooks/sample
mv $DOTPATH/.git/hooks/*.sample $DOTPATH/.git/hooks/sample
ln -s $DOTPATH/githooks/* $DOTPATH/.git/hooks

#i3 dotfiles
ln -s $DOTPATH/i3 $HOME/.config/
ln -s $DOTPATH/bin $HOME/

#atom
if [ -d $HOME/.atom ];then
  SETTING_FILES=(atom-packages comfig.cson terminal-commands.json)
  
  for TARGET in ${SETTING_FILES[@]}
  do
    ln -s $DOTPATH/atom/$TARGET $HOME/.atom/
  done
fi

# restart shell
exec $SHELL -l
