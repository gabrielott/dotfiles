#!/bin/sh

# Downloads some config files and sets my keyboard layout.

curl -q 'https://raw.githubusercontent.com/gabrielott/dotfiles/master/.vimrc' -o ~/.vimrc
curl -q 'https://raw.githubusercontent.com/gabrielott/dotfiles/master/.inputrc' -o ~/.inputrc

if lsusb | fgrep -q 'Holtek Semiconductor, Inc. USB-HID Keyboard'; then
	echo 'Keyboard detected, setting xkb layout to US.'
	setxkbmap us
else
	echo 'Keyboard not detected, setting xkb layout to Colemak and swapping ctrl with caps lock.'
	setxkbmap us colemak ctrl:swapcaps
fi
