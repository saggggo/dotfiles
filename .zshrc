# login shell
# /etc/zsh/zshenv(cannot be overridden)
# -> $ZDOTDIR/.zshenv
# -> /etc/zsh/zprofile
# -> $ZDOTDIR/.zprofile
# -> /etc/zsh/zshrc
# -> $ZDOTDIR/.zshrc
# -> /etc/zsh/zlogin

# interactive shell
# /etc/zsh/zshenv
# -> $ZDOTDIR/.zshenv
# -> /etc/zsh/zshrc
# -> $ZDOTDIR/.zshrc

#autocomplete
setopt correct
autoload -Uz promptinit
autoload colors && colors
promptinit
prompt adam1
setopt histignorealldups

#invalid ctrl+d
#setopt ignore_eof 

# custom keybind
bindkey -e
bindkey "^H" kill-word

#histfile{{{
  # Keep 100000 lines of history within the shell and save it to ~/.zsh_history:
  HISTFILE=~/.history
  HISTSIZE=100000
  SAVEHIST=100000
  #when you are root, you don't write command histry
  if [ $UID = 0 ]; then
      unset HISTFILE
      SAVEHIST=0
  fi
  #ignore duplication command history list
  setopt hist_ignore_dups
  #share histfile many terminal
  setopt share_history
  #when command histry was overlapped, remove old command
  setopt hist_ignore_all_dups
  #not override, append
  setopt append_history
  #don't add timestamp to histfile
  unsetopt EXTENDED_HISTORY
#}}}

# Use modern completion system
autoload -Uz compinit
compinit

#custom alias
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source /usr/local/bin/aws_zsh_completer.sh

if [ -d $HOME/.zfunc ]; then
    fpath+=$HOME/.zfunc
fi

#import local settings
if [ -f $HOME/.zshrc.local ];then
    source $HOME/.zshrc.local
fi

#import separate setting file
for file in `find -L $HOME/.zsh.d -type f`; do
    source $file
done

