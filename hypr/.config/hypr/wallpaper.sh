#!/bin/bash
CONF=~/dotfiles/hypr/.config/hypr/hyprpaper.conf
WALLDIR="/home/neotop/Pictures/wallpapers"

ls $WALLDIR
echo "Wallpaper Name"
read filename
sed -i "s|path = $WALLDIR/.*|  path = $WALLDIR/$filename|" "$CONF"
pkill hyprpaper
sleep 0.5
hyprpaper > /dev/null 2>&1 &


