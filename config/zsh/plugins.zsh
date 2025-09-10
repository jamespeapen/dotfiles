source "$ZDOTDIR/antidote/antidote.zsh"
if [[ ! "$ZDOTDIR/.zsh_plugins.zsh" -nt "$ZDOTDIR/plugin_list.txt"  ]]; then
    antidote bundle < "$ZDOTDIR/plugin_list.txt" > "$ZDOTDIR/.zsh_plugins.zsh"
fi
source "$ZDOTDIR/.zsh_plugins.zsh"

# p10k prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    ]]; then 
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi

export POWERLEVEL9K_CONFIG_FILE="$XDG_CONFIG_HOME/zsh/p10k.zsh"
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
[[ ! -f "$XDG_CONFIG_HOME/zsh/p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/p10k.zsh"

# fzf
[[ -x "$(command -v fzf-share)" ]] && source "$(eval fzf-share)/key-bindings.zsh"  

# FZF
if [[ $platform == "Darwin" ]]; then
    export FZF_DEFAULT_COMMAND="fd --type f --exclude Library"
    export FZF_ALT_C_COMMAND="fd -t d --exclude=Library --exclude=go"
else
    export FZF_DEFAULT_COMMAND="fd --type f"
    export FZF_ALT_C_COMMAND="fd -t d --no-ignore-vcs"
    export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --preview-window=right:50%"
    export FZF_DEFAULT_OPTS="--color fg+:italic,hl:-1:underline,hl+:-1:reverse:underline"
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'exa --tree --icons {} | head -200'"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" --color=fg:#ebdbb2,bg:-1,hl:#689d6a --color=fg+:#fbf1c7,bg+:#3c3836,hl+:#8ec07c --color=info:#98971a,prompt:#cc241d,pointer:#d3869b --color=marker:#b8bb26,spinner:#b16286,header:#83a598"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || exa --tree --color --icons {}) 2> /dev/null | head -200' --preview-window=right:40%"

# forgit
if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then;
    export FORGIT_COPY_CMD="xclip -selection clipboard"
else
    export FORGIT_COPY_CMD="wl-copy"
fi

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

if [[ "$(tput colors)" == "256" ]]; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=160
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=037,bold #,standout
    ZSH_HIGHLIGHT_STYLES[alias]=fg=061,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=064,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
    ZSH_HIGHLIGHT_STYLES[path]=fg=166,underline
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[assign]=fg=037
fi

# zsh-autosuggestions
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-i:toggle+down' 'ctrl-a:toggle-all'
