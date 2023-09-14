#!/bin/bash
slstatus &

pipewire &
pipewire-pulse &
wireplumber &

xwallpaper --zoom ~/Pictures/wallpaper.jpg

setxkbmap -layout us,ru -option grp:caps_toggle -option caps:none

