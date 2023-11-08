#!/bin/sh

setxkbmap -layout us,no 

alacritty &
feh --bg-scale ~/wallpapers/tokyo.jpg &
picom &

exec i3

