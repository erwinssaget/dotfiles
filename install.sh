#!/bin/bash

# Variables
TEXT_COLOR='\033[0;34m'
NOCOLOR='\033[0m'
PROGRAMS=(git vim zsh tmux wget curl i3 i3blocks konsole xclip)
PROGRAMS_TO_INSTALL=()
CODE_DIR=~/Code
DOT_DIR=~/Code/dotfiles

# Helper Functions
displayText() {
    echo -e "\n${TEXT_COLOR}$* ${NOCOLOR}\n";
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
displayText Would you like to install all programs \(${PROGRAMS[*]} \)?
read RESPONSE
case ${RESPONSE:0:1} in
    y|Y|yes )
        displayText Installing all ${#PROGRAMS[@]} programs
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
sh ./scripts/composer.sh

displayText Installing Composer Plugin Prestissimo \(for faster downloads\)
composer global require "hirak/prestissimo:^0.3"

displayText Installing Laravel Installer globally
composer global require "laravel/installer"

displayText Installing Laravel Valet Linux
sudo apt-get install -y libnss3-tools jq xsel
composer global require "cpriego/valet-linux"

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
#ln -s $DOT_DIR/zshrc ~/.zshrc
ln -s $DOT_DIR/gtk.css ~/.config/gtk-3.0/gtk.css
ln -s $DOT_DIR/i3config ~/.config/i3/config

displayText Configuring zsh...
cd ~

displayText Git Flow Completion
wget https://raw.githubusercontent.com/petervanderdoes/git-flow-completion/develop/git-flow-completion.zsh
mv git-flow-completion.zsh .git-flow-completion.zsh

displayText Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

displayText Zsh-nvm plugin
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

displayText Symlinking Theme
mkdir ~/.oh-my-zsh/custom
mkdir ~/.oh-my-zsh/custom/themes
ln -s $DOT_DIR/erwins.zsh-theme ~/.oh-my-zsh/custom/themes/erwins.zsh-theme

displayText Installing Vim Plugins
# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -i NONE -c VundleUpdate -c quitall

displayText Configure italics
cd ~
wget https://gist.githubusercontent.com/sos4nt/3187620/raw/8e13c1fec5b72d415ed2917590348451de5f8e58/xterm-256color-italic.terminfo

# Compile It
tic xterm-256color-italic.terminfo

#install spotify

read -p "Install Spotify (y/n)? " answer;
case ${answer:0:1} in
	y|Y|Yes )
		bash ./scripts/spotify.sh
	;;
	n|N|No )
		break
	;;
	*)
		echo "Not a valid answer. Please specify y or n."
	;;
esac


# Goes last since we need to restart afterwards
git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal
source ~/.config/base16-gnome-terminal/base16-ocean.dark.sh

rm xterm-256color-italic.terminfo

displayText Change shell to zsh
chsh -s $(which zsh)
