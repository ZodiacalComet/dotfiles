#!/bin/sh

# Use external monitor as the primary one
# Disable laptop's monitor
# Set resolution to 1024x768
xrandr --output VGA1 --primary
xrandr --output LVDS1 --off
xrandr --output VGA1 --mode 1024x768

# Restore wallpaper
if [ -f ~/wall ]
then
	feh --bg-max ~/wall --image-bg 000000
fi

# Merge .Xresources
xrdb -merge ~/.Xresources

# Set cursor
xsetroot -cursor_name left_ptr &

# Start dunst
dunst &

# Start flameshot
flameshot &

# Start sxhkd
sxhkd &

# Start mpd
mpd &

# Start picom
picom &

# Start polybar
~/.config/polybar/launch.sh

# Starts BSPWM
exec bspwm
