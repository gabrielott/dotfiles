#!/usr/bin/env zsh

# Options
PS1='%B%1~$%b '
PROMPT_EOL_MARK='%B%K{red}\n%k%b'
KEYTIMEOUT=5
KEYBOARD_HACK=\'           # remove a trailing quote when there's an odd number of them on the line
setopt auto_cd             # cd without typing cd
setopt mark_dirs           # put a / when expanding directories
setopt no_unset            # error when an unset variable is used
setopt csh_null_glob       # ignore patterns with no matches; error if all patterns have no matches
setopt append_history      # append to the history file instead of replacing it
setopt extended_history    # include time and duration of each command to the history file
setopt extended_glob       # allow ^, ~, # and ## to be used in filename generation
setopt correct             # suggest a correction when a non-existent command is used
setopt bsd_echo            # disable escape sequences in echo unless -e is used (like bash)

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
# Edit command in vim with v
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# Makes backspace work after returning to insert mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line

# Colors and syntax highlighting
HIGHLIGHTING_PLUGIN_PATH=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors
if [ -f "$HIGHLIGHTING_PLUGIN_PATH" ]; then
	. "$HIGHLIGHTING_PLUGIN_PATH"
else
	echo 'Syntax highlighting plugin not installed.'
fi

# Named directories
hash -d b=~/.local/bin
hash -d c=~/.config
hash -d s=~/stuff
hash -d S=~/stuff2
hash -d ss=~/ssd
hash -d d=~/drive
hash -d p=~/projects
hash -d t=~/stuff/torrents
hash -d ufrj=~p/ufrj
hash -d htb=~p/htb

# Default options
alias ls='ls -hF --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias du='du -hc'
alias df='df -h'
alias free='free -h'
alias zathura='zathura --fork'

# Stop programs from spamming version/copyright info
alias python='python -q'
alias julia='julia -q'
alias R='R -q'
alias pwsh='pwsh -NoLogo'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias gdb='gdb -q'

# Start lf with custom script
alias lf='lf-ueberzug'

# Shortcuts
alias proj='fzf_cd_into_dir ~p'
alias ufrj='fzf_cd_into_dir ~ufrj'
alias htb='fzf_cd_into_dir ~htb'
alias lbin='fzf_edit_file_in_dir ~b'
alias toclip='xclip -i -selection clipboard'
alias fromclip='xclip -o -selection clipboard'

# Functions
fzf_cd_into_dir() {
	cd "$1/$(find "$1" -maxdepth 1 -type d | sed 's_.*/\(.*\)_\1_' | fzf)"
}

fzf_edit_file_in_dir() {
	"$EDITOR" "$1/$(find "$1/" -maxdepth 1 -type f | sed 's_.*/\(.*\)_\1_' | fzf)"
}
