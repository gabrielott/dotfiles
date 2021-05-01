#!/usr/bin/env zsh

# Options
PS1='%B%1~$%b '
PROMPT_EOL_MARK='%B%K{red}\n%k%b'
KEYTIMEOUT=5
setopt auto_cd             # cd without typing cd
setopt mark_dirs           # put a / when expanding directories
setopt no_unset            # error when an unset variable is used
setopt append_history      # append to the history file instead of replacing it
setopt extended_history    # include time and duration of each command to the history file
setopt extended_glob       # allows ^, ~, # and ## to be used in filename generation

# Save history for a long time
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=9999999
SAVEHIST=9999999

# Vi mode is set implicitly since $EDITOR is set to vim.
# These functions change the cursor according to the current mode.
CURSOR_NORMAL='\e[1 q'
CURSOR_INSERT='\e[5 q'
zle-keymap-select() {
	case "$KEYMAP" in
		vicmd) echo -ne "$CURSOR_NORMAL" ;;
		viins|main) echo -ne "$CURSOR_INSERT" ;;
	esac
}
zle -N zle-keymap-select

zle-line-init() {
	echo -ne "$CURSOR_INSERT"
}
zle -N zle-line-init

zle-line-finish() {
	echo -ne "$CURSOR_NORMAL"
}
zle -N zle-line-finish

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' format 'Completing %d'
compinit -d ~/.cache/zsh/zcompdump

# Keybinds
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Colors and syntax highlighting
HIGHLIGHTING_PLUGIN_PATH=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors
if [ -f "$HIGHLIGHTING_PLUGIN_PATH" ]; then
	. "$HIGHLIGHTING_PLUGIN_PATH"
else
	echo 'Syntax highlighting plugin not installed.'
fi

# Named directories
hash -d s=~/stuff
hash -d S=~/stuff2
hash -d d=~/drive
hash -d p=~/projects
hash -d t=~/stuff/torrents
hash -d ufrj=~/projects/ufrj

# Aliases
alias ls='ls -hF --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias du='du -hc'
alias df='df -h'
alias free='free -h'

alias lf='lf-ueberzug'
