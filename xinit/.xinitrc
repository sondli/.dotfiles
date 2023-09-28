#!/bin/sh

alacritty &
wal -R
picom &

exec i3

