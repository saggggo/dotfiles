DOTPATH=${DOTPATH:-$HOME/dotfiles}

#apt
apt-get update && apt-get upgrade
while read line; do
    apt-get install -y $TARGET
done < ${DOTPATH}/etc/apt.essential

while true; do
    read -p "Do you wish to install GUI tools?" yn
    case $yn in
        [Yy]* )
            while read line; do
                apt-get install -y $TARGET
            done < ${DOTPATH}/etc/apt.desktop
            break;;
        [Nn]* )
            exit;;
        *)  echo "Please answer yes or no.";;
    esac
done
