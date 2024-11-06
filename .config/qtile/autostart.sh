#!/bin/sh
# These are run only the first time qtile is launched
feh --bg-scale /home/james/.backgrounds/cp.jpg &
picom --daemon &
/usr/bin/emacs --daemon &
nm-applet &
nextcloud &
