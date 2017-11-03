# login shell
# /etc/zsh/zshenv(cannot be overridden)
# -> $ZDOTDIR/.zshenv
# -> /etc/zsh/zprofile
# -> $ZDOTDIR/.zprofile
# -> /etc/zsh/zshrc
# -> $ZDOTDIR/.zshrc
# -> /etc/zsh/zlogin
# -> $ZDOTDIR/.zlogin

# interactive shell
# /etc/zsh/zshenv
# -> $ZDOTDIR/.zshenv
# -> /etc/zsh/zshrc
# -> $ZDOTDIR/.zshrc

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
