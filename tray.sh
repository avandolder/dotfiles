#!/bin/bash

pkill -f pasystray
pkill -f blueman-applet
pkill -f nm-applet

pasystray --notify=all &
blueman-applet &
nm-applet --indicator &
# Launch redshift tray icon
systemctl --user start redshift-gtk.service

