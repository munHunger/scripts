#!/bin/bash
ACTION=$(echo "connect
disconnect" | rofi -dmenu)

CONNECTED_MONITORS=$(xrandr -q | grep " connected " | awk '{ print$1 }')
DISCONNECTED_MONITORS=$(xrandr -q | grep " disconnected " | awk '{ print$1 }')


case "$ACTION" in
    "connect")
        SELECTED_MONITOR=$(xrandr -q | grep " connected " | awk '{ print$1 }' | rofi -dmenu)
        RESOLUTION=$(xrandr | awk -v monitor="^eDP-1 connected" '/connected/ {p = 0} $0 ~ monitor {p = 1} p' | awk '{ print$1 }' | sed -n '1!p' | rofi -dmenu)
        POSITION=$(echo "left-of
right-of
above
below
same-as" | rofi -dmenu)
        REFERENCE_MONITOR=$(xrandr -q | grep " connected [0-9]" | awk '{ print$1 }' | rofi -dmenu)
        echo "xrandr --output $SELECTED_MONITOR --mode $RESOLUTION --$POSITION $REFERENCE_MONITOR"
        xrandr --output $SELECTED_MONITOR --mode $RESOLUTION --$POSITION $REFERENCE_MONITOR
        ;;
    "disconnect")
        SELECTED_MONITOR=$(xrandr -q | grep " connected " | awk '{ print$1 }' | rofi -dmenu)
        xrandr --output $SELECTED_MONITOR --off
        ;; 
esac