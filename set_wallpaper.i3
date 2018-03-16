#!/bin/bash
#
# This script is run by Variety when a new wallpaper is set.
# You can use bash, python or whatever suits you for the script.
# Here you can put custom commands for setting the wallpaper on your specific desktop environment
# or run commands like notify-send to notify you of the change, or you can
# run commands that would theme your browser, login screen or whatever you desire.
#
# PARAMETERS:
# $1: The first passed parameter is the absolute path to the wallpaper image to be set as wallpaper
# (after effects, clock, etc. are applied).
#
# $2: The second passed parameter is "auto" when the wallpaper is changed automatically (i.e. regular change), "manual"
# when the user has triggered the change or "refresh" when the change is triggered by a change in quotes, clock, etc.
#
# $3: The third passed parameter is the absolute path to the original wallpaper image (before effects, clock, etc.)
#
# EXAMPLE:
# echo "$1" # /home/username/.config/variety/wallpaper/wallpaper-clock-fac0eef772f9b03bd9c0f82a79d72506.jpg
# echo "$2" # auto
# echo "$3" # /home/username/Pictures/Wallpapers/Nature/green-tunnel-1920x1080-wallpaper-861.jpg


# Here you may apply some additional custom operations on the wallpaper before it is applied.
# In the end put the path to the actual final wallpaper image file in the WP variable.
# The default is to simply set WP=$1.
WP=$1

feh --bg-fill "$WP" 2> /dev/null
