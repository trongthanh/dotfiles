#!/bin/bash
# Simple new OSX installation tolling set up
# Prerequisites:
# - Install SublimeText 3
# - XCode Command Line Tools (will be prompt to install while installing home brew)

# Change working dir here
cd "$(dirname "$0")"

echo "--> Installing Homebrew. This will also request OSX to install its commandline tools along the steps"

# At this command, if XCode command line tools were not installed, it will be prompted
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure brew is updated
brew update
# Check for issues
brew doctor

echo "--> Installing NodeJS & npm"

brew install node

echo "--> Installing Neccessary NodeJS packages"

npm install -g grunt-cli jshint jscs csslint yo bower http-server marked

echo "--> Installing Neccessary Ruby Gems"

sudo gem install sass scss-lint

echo "--> Syncing Sublime Text 3 standard settings (ST3 should be installed earlier)"
# Sync Sublime Text 3 settings
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ../sublimetext/Packages "~/Library/Application Support/Sublime Text 3/Packages/"
# Create symblink for ST3 subl command line
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

echo "--> Syncing (command line aliases and functions) dotfiles"

./sync.sh
