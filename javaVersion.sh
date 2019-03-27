#!/bin/bash

VERSION=$(update-java-alternatives -l | awk '{ print$1 }' | rofi -dmenu)
echo $VERSION
PASSWD="$(zenity --password --title=Authentication)\n"
echo -e $PASSWD | sudo -S update-java-alternatives -s $VERSION