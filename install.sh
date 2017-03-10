#!/bin/bash

# Variables
TEXT_COLOR='\033[0;34m'
NOCOLOR='\033[0m'
PROGRAMS=(git vim zsh tmux wget curl i3 i3blocks)
PROGRAMS_TO_INSTALL=()
CODE_DIR=~/Code
DOT_DIR=~/Code/dotfiles

# Helper Functions
displayText() {
    echo -e "${TEXT_COLOR}$* ${NOCOLOR}\n";
}

promptForProgramInstall() {
    # For each program, ask the user if they want to install it
    # If so add the program to install list
    # Install specified programs afterward

    for((i=0; i<${#PROGRAMS[@]}; i++ ));
    do
        read -p "Install ${PROGRAMS[$i]} (y/n)? " answer;
        case ${answer:0:1} in
            y|Y )
                PROGRAMS_TO_INSTALL+=( ${PROGRAMS[$i]} )
            ;;
            * )
            ;;
        esac
    done

    displayText Installing ${#PROGRAMS_TO_INSTALL[@]} programs
    sudo apt-get install -y ${PROGRAMS_TO_INSTALL[*]}
}

# ----------- Script Starts Here --------------------
displayText Updating list of available packages...
sudo apt-get update 

displayText Installing newer versions of installed packages...
sudo apt-get -y upgrade

# Install some software
displayText Would you like to install all programs \(${PROGRAMS[*]}
read RESPONSE
case ${RESPONSE:0:1} in
    y|Y|yes )
        displayText Installing ${#PROGRAMS[@]} programs
        sudo apt-get install -y ${PROGRAMS[*]}
    ;;
    * )
        promptForProgramInstall
    ;;
esac

# Install php7
displayText Installing php 7.0...
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get upgrade
sudo apt-get install -y php7.0 php7.0-cgi php7.0-cli php7.0-common php7.0-curl php7.0-dev php7.0-gd php7.0-xml php7.0-zip php7.0-mysql php7.0-pdo php7.0-mbstring

# Install Composer
displayText Installing Composer...
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
rm composer-setup.php
sudo mv composer.phar /usr/local/bin/composer

displayText Installing Laravel Installer globally
composer global require "laravel/installer"

displayText Making Code directory...
mkdir ~/Code
cd ~/Code

displayText Cloning dotfiles...
git clone https://github.com/erwinsaget/dotfiles.git
cd dotfiles

# Make i3 dir
mkdir ~/.config/i3

# Make symlinks
displayText Symlinking Files...
ln -s $DOT_DIR/aliases ~/.aliases
ln -s $DOT_DIR/vimrc ~/.vimrc
ln -s $DOT_DIR/tmux.conf ~/.tmux.conf
ln -s $DOT_DIR/zshrc ~/.zshrc
ln -s $DOT_DIR/gtk.css ~/.config/gtk-3.0/gtk.css
ln -s $DOT_DIR/i3config ~/.config/i3/config

cd ~
wget https://raw.githubusercontent.com/petervanderdoes/git-flow-completion/develop/git-flow-completion.zsh
mv git-flow-completion.zsh .git-flow-completion.zsh

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -i NONE -c VundleUpdate -c quitall

# Spotify
# Terminal themedd the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client

# Goes last since we need to restart afterwards
git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal

source ~/.config/base16-gnome-terminal/base16-ocean.dark.sh
