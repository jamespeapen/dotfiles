# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Profiler
#zmodload zsh/zprof

# Correction
setopt correct

# source plugins
source "$ZDOTDIR/plugins.zsh"

# prompt
autoload -Uz promptinit && promptinit && prompt powerlevel10k

# Completion
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

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

# navi
eval "$(navi widget zsh)"

# cargo
[[ -f ~/.cargo/env ]] && source ~/.cargo/env && . "$HOME/.cargo/env"

#zprof

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# extras
[[ -f ~/.extras.zsh ]] && source ~/.extras.zsh

# HISTORY
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
setopt APPENDHISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

