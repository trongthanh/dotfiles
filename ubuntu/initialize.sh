#!/bin/bash

sudo apt-get install apt-transport-https curl

# Add Sublime Text PPA (-y for unattended process)
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Add NodeJS PPA
wget -qO - https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Add Yarn package PPA
wget -qO - https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
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
sudo apt-get install -y git gitg ubuntu-restricted-extras sublime-text nodejs yarn build-essential google-chrome-stable

# Sync my Sublime Text 3 settings
../sublimetext/link-linux.sh

# Mannual: Add ibus-daemon to start up program

# TODO: install my fonts

# Install auto power control
sudo apt install tlp tlp-rdw
sudo tlp start

## Install required package for node-gyp
sudo apt install -y libcairo2-dev libjpeg-dev libgif-dev


# MATE Destop only:

## Disable super key to open App Menu, switch to right Super key
gsettings set org.mate.mate-menu hot-key ''
gsettings set com.solus-project.brisk-menu hot-key 'Super_R'
