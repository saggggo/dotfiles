#!/bin/bash
DOTPATH=${DOTPATH:-$HOME/dotfiles}

cd $DOTPATH
git submodule init
git submodule update

# dotfiles link
while read line; do
  if [ ! -f $HOME/$line ]; then
    ln -s $HOME/dotfiles/$line $HOME/$line
  fi
done < ${DOTPATH}/etc/dotfiles

if [ ! -d $HOME/.zsh.d ]; then
  ln -s $DOTPATH/.zsh.d $HOME/
fi

if [ ! -d $HOME/bin ]; then
  ln -s $DOTPATH/bin $HOME/
fi

# githooks
if [ ! -d $DOTPATH/.git/hooks/sample ]; then
  mkdir -p $DOTPATH/.git/hooks/sample
  mv $DOTPATH/.git/hooks/*.sample $DOTPATH/.git/hooks/sample
  ln -s $DOTPATH/githooks/* $DOTPATH/.git/hooks
  git submodule update
fi

#gui dotfiles
if [ `uname` = "Linux" ]; then
  if [ ! -d $HOME/.config/i3 ]; then
    ln -s $DOTPATH/i3 $HOME/.config/
  fi
fi

# restart shell
exec $SHELL -l
