DOTPATH=${DOTPATH:-$HOME/dotfiles}

#apt
apt-get update && apt-get upgrade
while read line; do
    apt-get install -y $TARGET
done < ${DOTPATH}/etc/apt.essential
