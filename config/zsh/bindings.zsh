# emacs mode
#set -o emacs
bindkey -e

# movement
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M emacs '^[[1;5D' backward-word

# delete
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^[[3;5~' kill-word
# add '/' to delimiters for words
export WORDCHARS=${WORDCHARS/\//}
bindkey '^W' backward-kill-word

# mappings
bindkey -s '\ey' 'eza -l --icons --git\n'
bindkey -s '\e;' 'eza -la --icons --git\n'
bindkey -s '\et' 'task\n'

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word
