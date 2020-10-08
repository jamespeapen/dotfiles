#--------------------Configs, sync package lists------------------------------------------------- 
# list all installed_packages
function get-installed-packages() {
    apt list --installed | sed 's/\/.*//' | sort | uniq | tee installed_packages
}

#sync dotfiles and return in dotfiles dir
function sync-dots() {
    cp ~/.zshrc $DOTFILES/zshrc
    cp ~/.vimrc $DOTFILES/vimrc
    cp ~/.vim/plugins.vim $DOTFILES/vim
    cp ~/.vim/lightline.vim $DOTFILES/vim
    cp ~/.vim/mappings.vim $DOTFILES/vim
    cp ~/.vim/settings.vim $DOTFILES/vim
    cp ~/.vim/ui.vim $DOTFILES/vim
    cp ~/.tmux.conf $DOTFILES/tmux.conf
    cp ~/.my_funcs.sh $DOTFILES/my_funcs.sh
    cp -r ~/.config/sway/* $DOTFILES/config/sway/
    cp -r ~/.config/waybar/* $DOTFILES/config/waybar/
    cd $DOTFILES
    git status
}

#--------------------Logs------------------------------------------------- 

# get ssh logs with date and time
function ssh-log() {
    grep -a Accepted /var/log/auth.log | sed -r -e 's/^(.*)\s.*from\s([0-9]*.*)\sport.*$/\1 \2/' 
}

# get ip addrs with counts
function ssh-ips() {
    grep -a Accepted /var/log/auth.log  | sed -r -e 's/.*from ([0-9]+.*) port ([0-9]+) .*/\1/'| sort | uniq -c | sort 
}

# get invalid ips, usernames
function ssh-invalid() {
    grep -a Invalid /var/log/auth.log | sed -r -e 's/^(.*)\s.*\suser\s(.*)from\s([0-9]*.*)\sport.*$/\1 \3 \2/'
}

# get sudo commands
function sudo-log() {
    ##Ubuntu logs
    #grep -a sudo /var/log/auth.log | grep COMMAND| sed -r -e 's/^(.*)\s.*(sudo).*COMMAND=\/.*bin\/(.*$)/\1 \2 \3/'

    #systemd
    sudo journalctl /usr/bin/sudo | grep COMMAND | sed -r -e 's/(^.*).* (sudo).*COMMAND=.*\/s?bin\/(.*$)/\1 \2 \3/'
}

function crypt-log() {
    sudo journalctl /usr/lib/systemd/systemd-cryptsetup | grep Failed | sed -r -e 's/(^.*).*: (Failed.*$)/\1 \2/'
}

#check for recent intel atomic failures from syslog
function atomic() {
    cat /var/log/syslog | grep Atomic
}

#--------------------Searching------------------------------------------------

# rg -i with fzf file preview
rgf() {
    local preview_cmd
    preview_cmd="echo {} | sed 's/(.*:[0-9]+).*//' | xargs -0 preview {}"
    if [ "$1" != "" ]; then
        rg -i --line-number "$1" -g '!R' > /tmp/rgsearch
        if [ $? -eq 0 ]; then
            cat /tmp/rgsearch | fzf --delimiter : --preview="$preview_cmd" --preview-window +{2}-20 --bind="enter:execute(less {1})"
        else
            echo "No results found for $1"
        fi
    else
        echo "Enter a search string"
    fi
}

agstring() {
    local cmd
    cmd="echo {} | sed 's/:.*//' | xargs -I% highlight -O ansi -l % 2> /dev/null"
    if [ "$1" != "" ]; then
        ag "$1" | fzf --preview="$preview_cmd"
    else
        echo "Enter a search string"
    fi
}

# get number of non-empty lines from a folder and a file type
code-lines() {
    local files=$(grep -c -v --recursive "^$" "$1"/**/*."$2") 
    echo $files
    echo "total:" $(echo $files | sed 's/.*://' | paste -sd+ | bc)
}

#--------------------Git------------------------------------------------------
in-git () {
    git rev-parse --is-inside-work-tree > /dev/null;
}

# fuzzy search for modified files
gco () {
    # check if git repo
    in-git || return 1

    local files

    files=($(git ls-files -m))
    if [[ -z "$files" ]]; then
        echo "nothing to commit, working directory clean"
    else
    files=$(git ls-files -m | fzf --preview='git diff --color=always {}')
        [[ -n "$files" ]] && git commit -v "${files[@]}"
    fi
}
