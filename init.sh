#!/bin/bash
DOTPATH=${DOTPATH:-$HOME/dotfiles}

cd $DOTPATH
git submodule init
git submodule update

# dotfiles link
while read line; do
    ln -s $HOME/dotfiles/$line $HOME/$line
done < ${DOTPATH}/etc/homefiles
ln -s $DOTPATH/.zsh.d $HOME/

ln -s $DOTPATH/bin $HOME/

# githooks
mkdir -p $DOTPATH/.git/hooks/sample
mv $DOTPATH/.git/hooks/*.sample $DOTPATH/.git/hooks/sample
ln -s $DOTPATH/githooks/* $DOTPATH/.git/hooks
git submodule update

#gui dotfiles
if [ `uname` = "Linux" ]; then
  ln -s $DOTPATH/i3 $HOME/.config/
fi

# restart shell
exec $SHELL -l
