#!/usr/bin/env zsh

# Options
setopt autocd
PS1='%B%1~$%b '

# Save history for a long time
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=9999999
SAVEHIST=9999999

# Vi mode is set implicitly since $EDITOR is set to vim.
# These functions change the cursor according to the current mode.
zle-keymap-select() {
	case "$KEYMAP" in
		vicmd) echo -ne '\e[1 q' ;;
		viins|main) echo -ne '\e[5 q' ;;
	esac
}
zle -N zle-keymap-select

zle-line-init() {
		echo -ne '\e[5 q'
}
zle -N zle-line-init


# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' format 'Completing %d'
compinit -d ~/.cache/zsh/zcompdump

# Colors and syntax highlighting
HIGHLIGHTING_PLUGIN_PATH=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors
if [ -f "$HIGHLIGHTING_PLUGIN_PATH" ]; then
	. "$HIGHLIGHTING_PLUGIN_PATH"
else
	echo 'Syntax highlighting plugin not installed.'
fi

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
