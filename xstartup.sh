#!/bin/sh

xrdb $HOME/.Xresources
xsetroot -solid black
export XKL_XMODMAP_DISABLE=1
/etc/X11/Xsession
i3 &
