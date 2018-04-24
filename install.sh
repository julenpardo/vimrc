#!/bin/bash

USERNAME=$USER
USER_HOME=$HOME

option=$1


if [ "$option" = "--rc-only" ]
then
    # Copy config
    cp vimrc "$USER_HOME/.vimrc"
fi

if [ "$option" = "" ]
then
    # Copy config
    cp vimrc "$USER_HOME/.vimrc"

    # Vundle installation
    git clone https://github.com/gmarik/Vundle.vim.git "$USER_HOME/.vim/bundle/Vundle.vim"

    sudo apt-get update

    # Dependencies
    sudo apt-get install -y python-dev \
                            python3-dev

    # Pip dependencies
    sudo pip2 install powerline-status \
                      jedi \
                      flake8
    sudo pip3 install powerline-status \
                      jedi \
                      flake8

    # php-cs-fixer
    sudo wget http://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -O /usr/local/bin/php-cs-fixer
    sudo chmod a+rx /usr/local/bin/php-cs-fixer

    # Fix permissions, just in case
    sudo su -c "chown -R $USERNAME:$USERNAME $USER_HOME/.vim"
    sudo su -c "chmod u+rwx -R $USER_HOME/.vim/*"

    # Install plugins with Vundle
    vim +PluginInstall +qall!
fi
