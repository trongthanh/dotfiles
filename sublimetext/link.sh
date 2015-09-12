#!/bin/bash

cd "$(dirname "$0")"

SCRIPTPATH=`pwd -P`

ln -s $SCRIPTPATH/Packages/JavaScript ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
ln -s $SCRIPTPATH/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
