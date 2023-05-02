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