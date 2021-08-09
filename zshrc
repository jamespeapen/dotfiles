# p10k prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    ]]; then 
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi

# platform
platform=$(uname)

# PATH
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export JDK_HOME=/usr/lib/jvm/java-11-openjdk-11.0.8.10-2.fc32.x86_64
export XDG_DATA_HOME=~/.local/share
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# man pages
#export PAGER='most'

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ZSH_TMUX_AUTOSTART='true'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"


# Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(sudo cargo forgit colored-man-pages fzf-tab zsh-syntax-highlighting zsh-autosuggestions)

# custom files
source $ZSH/oh-my-zsh.sh
source ~/.my_funcs.zsh

# completion accept
bindkey '^ ' autosuggest-accept

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# aliases
alias ls="exa --git"
alias vim="nvim"
alias cl="cal -3m"

# config editing
alias zshconfig="$EDITOR ~/.zshrc"
alias nvimconfig="$EDITOR ~/.config/nvim"
alias tmuxconfig="$EDITOR ~/.tmux.conf"
alias swayconfig="$EDITOR ~/.config/sway/config"
alias gitconfig="$EDITOR ~/.gitconfig"

# git
alias fcho="git for-each-ref --format='%(refname:short)' refs/heads |fzf|xargs git checkout"
alias gcommit="git commit -v "

alias sed="sed -E "

# dnf
alias suinstall="sudo dnf install"

# session
alias quit="gnome-session-quit"
alias :q="exit"

# file explorer
alias rr="ranger"

# system sensors
alias temps='watch -n 1 sensors'

# protonvpn
alias pvpnc="sudo protonvpn c -f"
alias pvpns="sudo protonvpn s"
alias pvpnd="sudo protonvpn d"

# fzf
[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh

if [[ $platform == "Darwin" ]]; then
    export FZF_DEFAULT_COMMAND='fd --type f --exclude Library'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd -t d --exclude=Library --exclude=go"
else
    export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --preview-window=right:50%"
    export FZF_DEFAULT_OPTS='--color fg+:italic,hl:-1:underline,hl+:-1:reverse:underline'
fi

export FZF_ALT_C_OPTS="--preview 'exa --tree --icons {} | head -200'"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#ebdbb2,bg:-1,hl:#689d6a --color=fg+:#fbf1c7,bg+:#3c3836,hl+:#8ec07c --color=info:#98971a,prompt:#cc241d,pointer:#d3869b --color=marker:#b8bb26,spinner:#b16286,header:#83a598'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || exa --tree --color --icons {}) 2> /dev/null | head -200' --preview-window=right:40%"

# Colors
export TERM='xterm-256color'

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

# zoxide
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

