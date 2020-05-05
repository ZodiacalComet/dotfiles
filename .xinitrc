#!/bin/sh

# Use external monitor as the primary one
# Disable laptop's monitor
# Set resolution to 1024x768
xrandr --output VGA1 --primary
xrandr --output LVDS1 --off
xrandr --output VGA1 --mode 1024x768

# Restore wallpaper
if [ -f ~/wall.png ]
then
	feh --bg-max ~/wall.png --image-bg 000000
fi

# Merge .Xresources
xrdb -merge ~/.Xresources

# Set cursor
xsetroot -cursor_name left_ptr &

# Start sxhkd
sxhkd &

# Start mpd
mpd &

# Start polybar
~/.config/polybar/launch.sh

# Starts BSPWM
exec bspwm

