# dirs
alias ls="eza -l --git --icons=always"
alias md="mkdir -p"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# utils
alias cal3="cal -3"
alias e="nvim"
alias clip="xclip -selection clipboard"

# util options
alias rm='safe-rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep="grep --color"

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

# application
alias Radian="nix-shell -p python311Packages.radian R --command radian"
alias play="nix-shell -p $1 --command zsh"

# config editing
alias zshconfig="$EDITOR ~/.config/zsh/.zshrc"
alias nvimconfig="$EDITOR ~/.config/nvim"
alias tmuxconfig="$EDITOR ~/.tmux.conf"
alias swayconfig="$EDITOR ~/.config/sway/config"
alias gitconfig="$EDITOR ~/.gitconfig"

# git
alias gcommit="git commit -v "
alias vit="nvim +Git -c ':only'"
alias vson="nvim '+set ft=json'"
alias cgr='cd $(git rev-parse --show-toplevel)'

alias sed="sed -E "

# dnf
if [[ "$OS_RELEASE" == "Fedora Linux" ]]; then
    alias suinstall="sudo dnf install"
elif [[ "$OS_RELEASE" == "Ubuntu" ]]; then
    alias suinstall="sudo apt-get install"
fi

alias tmxd="eval \$(tmux showenv -s | grep -E '^(SSH|DISPLAY)')"

# session
alias quit="gnome-session-quit"

# system sensors
alias temps='watch -n 1 sensors'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
