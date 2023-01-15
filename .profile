#!/bin/sh

# Adds ~/.local/bin to PATH
export PATH="$PATH":"$HOME/.local/bin"

# Default programs
export EDITOR=nvim
export TERMINAL=st
export BROWSER=firefox-developer-edition
export FILE=lf-ueberzug

# Sets fcitx as input method for japanese
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# XKB compose file
export XCOMPOSEFILE="$HOME/.config/xkb/compose"

# Scale Java programs such as Burp Suite
export _JAVA_OPTIONS="-Dsun.java2d.uiScale=2"

# ripgrep config
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"

# Please stop storing random files in $HOME by default :(
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export GOPATH="$XDG_CONFIG_HOME/go"
export JULIA_DEPOT_PATH="$XDG_CONFIG_HOME/julia"
export MAXIMA_USERDIR="$XDG_CONFIG_HOME/maxima"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE="$XDG_CONFIG_HOME/lesshst"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv/GLCache"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv/ComputeCache"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export MYSQL_HISTFILE="$XDG_CACHE_HOME/mysql_history"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"

PS1='[\u@\h \W]\$ '

[ "$(tty)" = "/dev/tty1"  ] && ! pgrep -x Xorg >/dev/null && startx
