#!/bin/bash
DOTPATH=${DOTPATH:-$HOME/dotfiles}

cd $DOTPATH
git submodule init
git submodule update

# check command existance
# command -v zsh || {echo "'zsh' command is not found." && exit 1;}


# dotfiles link
dotfiles=(
  ".aliases"
  ".profile"
  ".env_profile"
  ".bash_profile"
  ".bash_login"
  ".bashrc"
  ".vimrc"
  ".gitconfig"
  ".vimrc"
  ".xinputrc"
  ".zprofile"
  ".zshenv"
  ".zlogin"
  ".Xmodmap"
  ".tmux.conf"
)
for line in ${dotfiles[@]}; do
  if [ -e "$HOME/$line" ]; then
    read -p "$HOME/$line is exist. Do you want to overwrite? [y/n]: " answer < /dev/tty
    if [ "$answer" != "${answer#[Yy]}" ]; then
      mv $HOME/$line $HOME/$line._temporary
      ln -s $HOME/dotfiles/$line $HOME/$line && rm $HOME/$line $HOME/$line._temporary || mv $HOME/dotfiles.bak/$line.bak $HOME/$line._temporary
    fi
  else
    ln -s $HOME/dotfiles/$line $HOME/$line
  fi
done

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
