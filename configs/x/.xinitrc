#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

compton -cG&
xrdb -merge ~/.Xresources
nitrogen --restore
xset +fp ${HOME}/.fonts
xset fp rehash
sxhkd &
conky &
exec bspwm
