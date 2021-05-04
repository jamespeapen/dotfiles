#--------------------Configs, sync package lists------------------------------------------------- 
# list all installed_packages
function get-installed-packages() {
    apt list --installed | sed 's/\/.*//' | sort | uniq | tee Documents/LINUX_SOFTWARE/installed_packages
}

#sync dotfiles and return in dotfiles dir
function sync-dots() {
    cp ~/.zshrc ~/Documents/dotfiles/zshrc

    cp ~/.vimrc ~/Documents/dotfiles/vimrc
    
    cp ~/.config/kitty/kitty.conf ~/Documents/dotfiles/config/kitty/

    cp ~/.config/nvim/init.vim ~/Documents/dotfiles/config/nvim/
    cp ~/.config/nvim/plugins.vim ~/Documents/dotfiles/config/nvim/
    cp ~/.config/nvim/lightline.vim ~/Documents/dotfiles/config/nvim/
    cp ~/.config/nvim/mappings.vim ~/Documents/dotfiles/config/nvim/
    cp ~/.config/nvim/settings.vim ~/Documents/dotfiles/config/nvim/
    cp ~/.config/nvim/ui.vim ~/Documents/dotfiles/config/nvim/
    cp ~/.config/nvim/coc-settings.json ~/Documents/dotfiles/config/nvim/

    cp ~/.tmux.conf ~/Documents/dotfiles/tmux.conf
    cp ~/.my_funcs.sh ~/Documents/dotfiles/my_funcs.sh

    cp -r ~/.config/sway/* ~/Documents/dotfiles/config/sway/
    cp -r ~/.config/waybar/* ~/Documents/dotfiles/config/waybar/

    cd ~/Documents/dotfiles
    git status
}

# kitty dark mode
function dark-mode() {
   sed -i 's/foreground #282828/foreground #fbf1c7/' ~/.config/kitty/kitty.conf
   sed -i 's/background #fbf1c7/background #1d2021/' ~/.config/kitty/kitty.conf
   sed -i 's/background=light/background=dark/' ~/.vim/ui.vim
   sed -i 's/colorscheme PaperColor/colorscheme gruvbox/' ~/.vim/ui.vim
   sed -i 's/PaperColor/gruvbox/' ~/.vim/lightline.vim
}

# kitty light mode
function light-mode() {
   sed -i 's/foreground #fbf1c7/foreground #282828/' ~/.config/kitty/kitty.conf
   sed -i 's/background #1d2021/background #fbf1c7/' ~/.config/kitty/kitty.conf
   sed -i 's/background=dark/background=light/' ~/.vim/ui.vim
   sed -i 's/colorscheme gruvbox/colorscheme PaperColor/' ~/.vim/ui.vim
   sed -i 's/gruvbox/PaperColor/' ~/.vim/lightline.vim
}

function ergo() {
    sed -i 's/xkb_variant/#xkb_variant/' ~/.config/sway/config
    sed -i 's/xkb_options/#xkb_options/' ~/.config/sway/config
    swaymsg reload
}

function lap() {
    sed -i 's/#xkb_variant/xkb_variant/' ~/.config/sway/config
    sed -i 's/#xkb_options/xkb_options/' ~/.config/sway/config
    swaymsg reload
}

function gitpuller { 
    for f in *;  do 
        if [ -d $f  -a ! -h $f ];  
        then  
            cd -- "$f";  
            git pull

            cd ..; 
        fi;  
    done;  
};
    
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
    ##non-systemd logs
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
            cat /tmp/rgsearch | \
                fzf --delimiter : --preview="$preview_cmd" \
                --preview-window +{2}-20 \
                --bind="enter:execute(less +{2} {1})"
        else
            echo "No results found for $1"
        fi
    else
        echo "Enter a search string"
    fi
    return 0
}

agstring() {
    local cmd
    cmd="echo {} | sed 's/:.*//' | xargs -I% highlight -O ansi -l % 2> /dev/null"
    if [ "$1" != "" ]; then
        ag "$1" | fzf --preview="$preview_cmd"
    else
        echo "Enter a search string"
    fi
    return 0
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
gcom () {
    # check if git repo
    in-git || return 1

    local files

    # get added and modified filenames
    files=($(git status --short | grep "^A\|\sM" | cut -c 4-))

    if [[ -z "$files" ]]; then
        echo "nothing to commit, working directory clean"
    else
    # select file to commit through fzf and preview window with diff
    files=$(git status --short | grep "^A\|\sM" | cut -c 4- | \
        fzf --preview='git diff HEAD --color=always {}')
        git commit -v "$files"
    fi
}

#--------------------Websites------------------------------------------------- 
# random site in private mode
function fox() {
    firefox -private-window $1 &
}

# search with DDG, search string must have '+' as delimiter
function duck() {
    search_url="https://duckduckgo.com/?q=${1}&t=canonical&ia=web"
    firefox -private-window $search_url &
}

# cmdline stopwatch, increments in 5 seconds
function stopwatch() {
    date1=`date +%s`; while true; do 
       echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
       sleep 5
    done
}

#--------------------Media------------------------------------------------- 

# radio
function radio() {
    declare -A urls
    urls[wblv]="https://wblv.streamguys1.com/live"
    urls[miradio]="http://17003.live.streamtheworld.com:80/WUOMFM_SC"
    urls[wyce]="http://ice24.securenetsystems.net/WYCE"
    urls[npr]="https://npr-ice.streamguys1.com/live.mp3"
    
    local command="$1"

    local -a stations

    stations=("wblv" "wyce" "miradio" "npr")

    if (( CURRENT == 2 )); then
        _describe 'command' stations
    fi
    
    if [[ "$platform" == "Darwin" ]]; then
        vlc -I http "$urls[$1]"
    else
        cvlc -Vdummy --play-and-exit -q "$urls[$1]" > /dev/null 2>&1
    fi
}

function _radio() {
    local command="$1"

    local -a stations

    stations=("wblv" "wyce" "miradio" "npr")

    if (( CURRENT == 2 )); then
        _describe 'command' stations
    fi
}

compdef _radio radio
 
# youtube-dl from url
function ydl() {
  if [[ "$platform" == "Darwin" ]]; then
    url=$(pbpaste)
  else
    url=$(wl-paste)
  fi
  echo "$url"
  urls=$(youtube-dl --get-url --format m4a "$url")
  for url in "$urls"
  do
    if [[ "$platform" == "Darwin" ]]; then
      vlc -I http "$url"
    else
      cvlc -Vdummy "$url"
    fi
  done
  return 0
}

#--------------------zsh------------------------------------------------- 

function exiting() {
    exit
}

zle -N exiter exiting
bindkey ',q'  exiter
