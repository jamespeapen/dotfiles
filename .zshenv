PLATFORM=$(uname)
OS_RELEASE=$(grep "^NAME" /etc/os-release | sed -E 's/^.*"(.*)"$/\1/')

# PATH
export PATH=$HOME/.local/bin:$PATH
export FPATH=$HOME/.local/share/zsh/completions:$HOME/.nix-profile/share/zsh/site-functions:$FPATH

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# ZSHCONFIG
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.zsh_history"
export HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=10000
export SAVEHIST=10000
export FPATH="$ANTIGEN_PATH/src/:$FPATH"

# EDITOR
export EDITOR="nvim"

# BROWSER
export BROWSER="firefox -private"

# FZF
if [[ $platform == "Darwin" ]]; then
    export FZF_DEFAULT_COMMAND="fd --type f --exclude Library"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd -t d --exclude=Library --exclude=go"
else
    export FZF_ALT_C_COMMAND="fd -t d"
    export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --preview-window=right:50%"
    export FZF_DEFAULT_OPTS="--color fg+:italic,hl:-1:underline,hl+:-1:reverse:underline"
fi

export FZF_ALT_C_OPTS="--preview 'exa --tree --icons {} | head -200'"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" --color=fg:#ebdbb2,bg:-1,hl:#689d6a --color=fg+:#fbf1c7,bg+:#3c3836,hl+:#8ec07c --color=info:#98971a,prompt:#cc241d,pointer:#d3869b --color=marker:#b8bb26,spinner:#b16286,header:#83a598"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || exa --tree --color --icons {}) 2> /dev/null | head -200' --preview-window=right:40%"

# cargo
source "$HOME/.cargo/env"
. "$HOME/.cargo/env"

