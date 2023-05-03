#!/bin/bash

# Check dependencies
if ! command -v git &>/dev/null; then
    echo "git could not be found"
    echo "do you want to install git? (Y/n)"
    read install_git
    if [ $install_git == "Y" ] || [ $install_git == "y" ]; then
        sudo -v
        sudo apt install git
    else
        echo "git is required to continue"
        exit
    fi
fi


# Request confirmation
echo "This script will prepare your system to a preset configuration"
echo "Do you want to continue? (Y/n)"
read confirmation
if [ $confirmation == "Y" ] || [ $confirmation == "y" ]; then
    echo "Preparing system..."
else
    echo "Aborting..."
    exit
fi

# Check if current directory is a git repository and is called setup-workstation
if [ ! -d ".git" ] || [ ! $(basename "$PWD") == "setup-workstation" ]; then
    # navigate to home directory
    cd ~

    # Clone repository
    echo "Cloning repository..."
    git clone https://github.com/panotaka/setup-workstation.git
    cd setup-workstation
fi

# Install zsh
echo "Installing zsh..."
sudo apt install zsh

# Set zsh as default shell
echo "Setting zsh as default shell..."
chsh -s $(which zsh)

# Install antigen to .antigen folder
echo "Installing antigen..."
mkdir ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh

# Copy .zshrc and .antigenrc to home directory
echo "Copying .zshrc and .antigenrc to home directory..."
cp .zshrc ~
cp .antigenrc ~

# Install nala
echo "Installing nala..."
sudo apt install nala

# Add nodesource repository and install nodejs
echo "Installing nodejs..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install yarn
echo "Installing yarn..."
sudo npm install --global yarn

# Remove all snap packages
echo "Removing snap packages..."
sudo snap remove $(snap list | awk '{print $1}')

# Remove snapd
echo "Removing snapd..."
sudo apt autoremove --purge snapd

# Install flatpak
echo "Installing flatpak..."
sudo apt install flatpak

# Install Add flathub repository
echo "Adding flathub repository..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo