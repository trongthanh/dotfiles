#!/bin/bash
# Simple new OSX installation tooling set up
# Prerequisites:
# - Install SublimeText 3
# - XCode Command Line Tools (will be prompt to install while installing home brew)

# Change working dir here
cd "$(dirname "$0")"

echo "--> Installing Homebrew. This will also request OSX to install its commandline tools along the steps"

# At this command, if XCode command line tools were not installed, it will be prompted
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "--> Installing NodeJS & npm"

brew install node

echo "--> Installing yarn CLI"

brew install yarn

echo "--> Installing Neccessary global Node.js packages"

npm install -g live-server eslint eslint_d prettier typescript stylelint
# prettier_d is installed with git url
npm install -g https://github.com/josephfrazier/prettier_d

echo "--> Install Pyments for code highlighted cat"

sudo easy_install Pygments

echo "--> Syncing Sublime Text 3 standard settings (ST3 should be installed earlier)"
# Sync Sublime Text 3 settings
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ../sublimetext/Packages "~/Library/Application Support/Sublime Text 3/Packages/"
# Create symblink for ST3 subl command line
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

echo "--> Syncing (command line aliases and functions) dotfiles"

./sync.sh
