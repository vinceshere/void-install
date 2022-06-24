#!/bin/sh

xset -dpms
xset s off

pipewire &
pipewire-pulse &
udiskie -a &
xrandr --output DisplayPort-2 --mode 1920x1080 --rate 144 &
exec dbus-run-session bspwm
