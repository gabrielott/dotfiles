#!/bin/sh

[ -f ~/.xprofile  ] && . ~/.xprofile
[ -f ~/.Xresources  ] && xrdb -merge -I$HOME ~/.Xresources

exec bspwm
