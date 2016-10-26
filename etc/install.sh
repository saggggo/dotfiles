#!bin/bash

PACKAGES=(ibus-mozc git vim zsh byobu atom i3 dex)

sudo apt-get update
for TARGET in ${PACKAGES[@]}
do
    sudo apt-get install -y $TARGET
done
