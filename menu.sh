#!/bin/bash
DIR=~/.script/

while :
do
    SELECTION=$(ls -a $DIR | grep -v 'menu.sh' | rofi -dmenu)

    if [[ -d $DIR$SELECTION ]]; then
        DIR=$DIR$SELECTION/
    elif [[ -f $DIR$SELECTION ]]; then
        exec $DIR$SELECTION
        exit 0
    else
        echo "$SELECTION is not valid"
        exit 1
    fi
done