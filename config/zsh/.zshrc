# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Profiler
#zmodload zsh/zprof

# Correction
setopt correctall

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
