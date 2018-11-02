#!/bin/bash
set -e # any error will stop the script

# Check for the existence of a file/path, and executed the command if it does not exist.
# Does file exist?
#   Yes: Do you want to rename it to filename.old?
#     Yes: Rename and execute command
#     No: Abort and do nothing
#   No: Execute command
# $1: file/directory to check
# $2: command to run (with eval)
check_existence_and_do () {
    # If target already exists
    if [[ -e $1 ]]
    then
        echo "Warning: $1 already exists!"
        read -p "Do you want me to rename $1 to $1.old in order to link the new file? (y/n): " -r
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            mv "$1" "$1.old"
            echo "Renamed $1 to $1.old"
        else
            echo "Aborting."
            exit
        fi
    fi

    # Made sure that $2 does not exist
    eval "$2"
}

# Link basic configuration
check_existence_and_do "$HOME/.vim" "ln -s $PWD $HOME/.vim"

# Install Vundle
echo "Getting Vundle ready ... "
git submodule init
git submodule update
# Checkout on master branch in Vundle submodule so it can upgrade itself
git submodule foreach --recursive git checkout master
echo "Done installing Vundle"

# Install other plugins
echo "Installing other plugins, you will need to press ENTER to continue."
vim +PluginInstall +qall
echo "Done installing plugins"

# Set up Neovim link
echo "Configuring Neovim ..."
mkdir -p "$HOME/.config/nvim"
check_existence_and_do "$HOME/.config/nvim/init.vim" "echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source $PWD/vimrc' > '$HOME/.config/nvim/init.vim'"

echo "Finished. You are all set."
