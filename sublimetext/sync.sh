#!/bin/bash
echo "--> Syncing Sublime Text 3 conventional settings: (ST3 should be installed earlier)"
cd "$(dirname "$0")"

function doIt() {
	# Sync Sublime Text 3 settings
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ./Packages/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt

# Create symblink for ST3 subl command line
echo ""
echo "--> Creating Sublime Text's command line shortcut 'subl':"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl