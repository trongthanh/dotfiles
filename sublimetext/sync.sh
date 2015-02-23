#!/bin/bash
# TODO: this is just a draft and not tested YET
echo "--> Syncing Sublime Text 3 conventional settings (ST3 should be installed earlier)"
# Sync Sublime Text 3 settings
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ./Packages "~/Library/Application Support/Sublime Text 3/Packages/"
# Create symblink for ST3 subl command line
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl