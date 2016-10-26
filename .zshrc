# Set up the prompt
#shellscriptでは読み込まれないことに注意！

#文字コードUTF-8
export LANG=ja_JP.UTF-8
#コマンドのスペルミスを指摘
setopt correct
#補完
#コマンド特有の補完
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

#ctrl+d(EOF)が入力されてもターミナルを閉じない
setopt ignore_eof 

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey "^H" kill-word

#履歴ファイル設定{{{
  # Keep 100000 lines of history within the shell and save it to ~/.zsh_history:
  HISTFILE=~/.zsh_history
  HISTSIZE=100000
  SAVEHIST=100000
  #rootなら履歴を残さない
  if [ $UID = 0 ]; then
      unset HISTFILE
      SAVEHIST=0
  fi
  #ignore duplication command history list
  setopt hist_ignore_dups
  #履歴を複数の端末で共有
  setopt share_history
  #重複するコマンドは古い方を削除
  setopt hist_ignore_all_dups
  #複数のzshを同時に使用した際に履歴ファイルを上書きせず追加する
  setopt append_history
#}}}
 # Use modern completion system
 autoload -Uz compinit
 compinit

#custom alias
alias pstree='pstree -p'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pgrep='pgrep -l'
alias g='git'
alias gi='git'
alias gst="git status"
cdls(){
    \cd "$@" && ls
}
alias cd="cdls"

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
export PATH=$PATH:~/bin
if [ -f $HOME/.zshrc.local ];then
    source $HOME/.zshrc.local
fi
