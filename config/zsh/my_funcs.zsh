#--------------------Logs------------------------------------------------- 

# get ssh logs with date and time
# TODO add systemctl support
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

#--------------------Searching------------------------------------------------

# rg -i with fzf file preview
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

ghclone () {
    local orgs repo

    orgs=$(gh api /user/memberships/orgs | \
        jq | \
        grep -o -e "login.*" | \
        grep -v "jamespeapen" | \
        sed -E 's/^.*: "(.*)",/\1/' )

    orgs+=("\njamespeapen")
    repo=$(echo $orgs | fzf)

    gh repo list $repo | fzf | awk '{print $1}' | xargs echo #gh repo clone
}

#--------------------R------------------------------------------------- 
prettyr() {    
    while getopts ":hr:s:" option; do
        case ${option} in
            r ) 
                scope="$OPTARG"
                ;;
            s ) 
                strict="$OPTARG"
                ;;
            h )
                echo "Usage prettyr -r [spaces|line_breaks|tokens] -s [TRUE|FALSE] file"
                ;;
            \? ) 
                echo "Invalid option -$OPTARG" 1>&2
                ;;
        esac
    done
    shift $((OPTIND -1))
    files=("$@")
    echo "$strict"
    for file in $files; do
        R -e "styler::style_file(\"$file\", scope='$scope', strict=$strict)"
    done
}

#--------------------Websites------------------------------------------------- 
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
  
  if [[ "$platform" == "Darwin" ]]; then
    vlc -I http "$urls[$1]" --play-and-exit -q > /dev/null 2>&1
  else
    cvlc -Vdummy "$urls[$1]" --play-and-exit -q > /dev/null 2>&1
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
    if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
        url=$(xclip -selection clipboard -o)
    else
        url=$(wl-paste)
    fi
  fi
  echo "$url"
  urls=$(yt-dlp --format bestaudio --audio-format mp3 --audio-quality 160K --get-url $url)
  for url in "$urls"
  do
    if [[ "$platform" == "Darwin" ]]; then
      vlc -I http "$url" --play-and-exit -q > /dev/null 2>&1
    else
      cvlc -Vdummy "$url" --play-and-exit -q > /dev/null 2>&1
    fi
  done
  return 0
}

