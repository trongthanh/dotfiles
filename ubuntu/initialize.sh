#!/bin/bash

# Add Sublime Text PPA
sudo add-apt-repository ppa:webupd8team/sublime-text-3
# Add NodeJS PPA
sudo add-apt-repository ppa:chris-lea/node.js

# Update all repo
sudo apt-get update

# Install Sublime Text
sudo apt-get install sublime-text-installer

##TODO: sync my sublimetext settings

# Install NodeJS
sudo apt-get install python-software-properties python g++ make
sudo apt-get install nodejs