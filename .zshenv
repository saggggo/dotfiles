#shellscript read this file
#zshenv -> zprofile -> zshrc 

case $TERM in
    linux)export LANG=C ;; #tty1-6
    *)export LANG=ja_JP.UTF-8 ;;
esac

#environment
export LANG=ja_JP.UTF-8
export EDITOR="vim"
#if type nvim >/dev/null; then
#  export EDITOR="nvim"
#else
#  export EDITOR="vim"
#fi

export PATH=$PATH:$HOME/bin:$HOME/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
if [[ -d $HOME/dotfiles ]]; then
  export DOTPATH=$HOME/dotfiles
fi

## gpu acceraration
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

export TERMINAL=gnome-terminal
