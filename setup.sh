DOT_FILES=(.vimrc .bashrc .zshenv .zshrc .gitconfig .Xmodmap .xinputrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
