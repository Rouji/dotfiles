#!/bin/sh

failsafe="xterm -ls -T Failsafe -geometry 80x24-0-0"
trap "exec $failsafe" EXIT SIGHUP SIGINT SIGPIPE SIGTERM SIGIO

~/.screenlayout/default.sh
#DPI stuff
xrdb -merge ~/.Xresources
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export GDK_DPI_SCALE=1.2

#qt theming
QT_QPA_PLATFORMTHEME=qt5ct

#autostart stuff
kdeconnect-cli >/dev/null 2>&1 &
~/bin/start_jack &

unset WINDOW_MANAGER STARTUP
exec $WINDOWMANAGER ${1+"$@"}

# call failsafe
exit 0
