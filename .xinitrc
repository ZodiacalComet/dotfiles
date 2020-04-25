#!/bin/sh

# Set resolution to 1024x720
xrandr -s 16

# Restore wallpaper and theme
wal -R

# Merge .Xresources
xrdb -merge ~/.Xresources

# Set cursor
xsetroot -cursor_name left_ptr &

# Start sxhkd
sxhkd &

# Start polybar
~/.config/polybar/launch.sh

# Starts BSPWM
exec bspwm

