#!/usr/bin/env bash

# Wallpaper daemon
swww-daemon &&
swww img ./wallpapers/house-in-mountains.webp &

brightnessctl s 20% &

# bar
~/.config/waybar/launch.sh &

nm-applet --indicator &

# Notifications
dunst
