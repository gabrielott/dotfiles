#!/bin/sh
# Downloads some config files and sets my keyboard layout.

curl "https://raw.githubusercontent.com/gabrielott/dotfiles/master/.vimrc" > "$HOME"/.vimrc
curl "https://raw.githubusercontent.com/gabrielott/dotfiles/master/.inputrc" > "$HOME"/.inputrc

lsusb | cut -d ' ' -f 7- | grep 'Holtek Semiconductor, Inc. USB-HID Keyboard' > /dev/null && setxkbmap 'us' || setxkbmap 'us(colemak)'
