#!/bin/sh
# This is run every time qtile is started or restarted
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add control = Control_L"
