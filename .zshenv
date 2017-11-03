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

case $TERM in
    linux)export LANG=C ;; #tty1-6
    *)export LANG=ja_JP.UTF-8 ;;
esac

source $HOME/.env_profile
