#!/bin/bash

# Add Sublime Text PPA (-y for unattended process)
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Add NodeJS PPA
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Add Yarn package PPA
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Add Google Chrome Stable PPA
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Add Firefox Beta PPA
sudo add-apt-repository ppa:mozillateam/firefox-next

# Update all repo
sudo apt-get update
sudo apt-get upgrade -y

# Install all neccessary packages:
sudo apt-get install -y git gitg ubuntu-restricted-extras sublime-text nodejs yarn build-essential google-chrome-stable fcitx


# Sync my Sublime Text 3 settings
# TODO: symlink ST3 settings from this repo to ~/.config folder
# rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ../sublimetext/Packages ~/.config/sublime-text-3


# Mannual: Add ibus-daemon to start up program

# TODO: install my fonts
