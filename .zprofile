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

if command -v pyenv > /dev/null; then
  eval "$(pyenv init --path)"
fi
