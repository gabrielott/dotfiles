#!/bin/sh

# Adds ~/.local/bin to PATH
export PATH="$PATH":"$HOME/.local/bin"

# Default programs
export EDITOR=vim
export TERMINAL=st
export BROWSER=firefox
export FILE=lf-ueberzug

# Sets fcitx as input method for japanese
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# XKB compose file
export XCOMPOSEFILE="$HOME/.config/xkb/compose"

# Please stop storing config files in $HOME by default :(
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export GOPATH="$XDG_CONFIG_HOME/go"
export JULIA_DEPOT_PATH="$XDG_CONFIG_HOME/julia"
export MAXIMA_USERDIR="$XDG_CONFIG_HOME/maxima"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE="$XDG_CONFIG_HOME/lesshst"
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv/GLCache"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv/ComputeCache"

PS1='[\u@\h \W]\$ '

[ "$(tty)" = "/dev/tty1"  ] && ! pgrep -x Xorg >/dev/null && startx
