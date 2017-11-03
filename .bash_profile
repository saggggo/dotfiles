# login shell
# /etc/profile
# -> $HOME/.bash_profile
# -> ($HOME/.bash_login)
# -> ($HOME/.profile)

# no login shell
# /etc/bash.bashrc
# -> $HOME/.bashrc

source $HOME/.env_profile

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
