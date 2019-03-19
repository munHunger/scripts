#!/bin/bash
DIR=~/.screenlayout/
SELECTION=$(ls -a $DIR | rofi -dmenu)
exec $DIR$SELECTION