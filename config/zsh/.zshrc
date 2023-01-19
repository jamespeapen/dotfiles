# Profiler
#zmodload zsh/zprof

# Correction
setopt correctall

# fzf
[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh

# source plugins
source "$ZDOTDIR/plugins.zsh"

# prompt
autoload -Uz promptinit && promptinit && prompt powerlevel10k

# Completion
autoload -U compinit; compinit

# source configs
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/bindings.zsh"
source "$ZDOTDIR/aliases.zsh"

# custom functions
source "$ZDOTDIR/my_funcs.zsh"

# zoxide
eval "$(zoxide init zsh)"

# direnv
eval "$(direnv hook zsh)"


#zprof
