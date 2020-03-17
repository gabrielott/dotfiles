export PATH="$PATH":"$HOME/.local/bin"
export EDITOR='vim'
export TERMINAL='st'
export BROWSER='firefox'
export FILE='lf'

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'

[ "$(tty)" = "/dev/tty1"  ] && ! pgrep -x Xorg >/dev/null && exec startx
