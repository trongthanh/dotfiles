#!/bin/bash

cd "$(dirname "$0")"

SCRIPTPATH=`pwd -P`

ln -s $SCRIPTPATH/Packages/JavaScript ~/.config/sublime-text-3/Packages/
ln -s $SCRIPTPATH/Packages/User ~/.config/sublime-text-3/Packages/
