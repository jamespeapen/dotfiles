# ----------------------------- Configs, packages for syncing -----------------------------------------
# list all installed_packages
function get-installed-packages() {
    apt list --installed | sed 's/\/.*//' | sort | uniq | tee Documents/software/installed_packages
}

#sync dotfiles and return in dotfiles dir
function sync-dots() {
    cp ~/.zshrc rpi_zshrc
    cp ~/.vimrc rpi_vimrc
    cp ~/.tmux.conf rpi_tmux.conf
    cp ~/.my_funcs.sh rpi_my_funcs.sh
    mv rpi_zshrc rpi_vimrc rpi_tmux.conf rpi_my_funcs.sh Documents/dotfiles/
    cd Documents/dotfiles
}

# -----------------------------------------Logs-----------------------------------------------------

# get ssh logs with date and time
function ssh-log() {
    sudo grep -a Accepted /var/log/auth.log | grep sshd | sed -r -e 's/^(.*)\s.*from\s([0-9]*.*)\sport.*$/\1 \2/'
}

# get ip addrs with counts
function ssh-ips() {
    sudo grep -a Accepted /var/log/auth.log  | grep sshd | sed -r -e 's/.*from ([0-9]+.*) port ([0-9]+) .*/\1/'| sort | uniq -c | sort 
}

# get invalid ips, usernames
function ssh-invalid() {
    sudo grep -a Invalid /var/log/auth.log | grep sshd | sed -r -e 's/^(.*)\s.*\suser\s(.*)from\s([0-9]*.*)\sport.*$/\1 \3 \2/'
}

# get sudo commands
function sudo-log() {
    sudo grep -a sudo /var/log/auth.log | grep COMMAND| sed -r -e 's/^(.*)\s (sudo).*COMMAND=\/.*bin\/(.*$)/\1 \2 \3/'
}

# -- CPU TEMP -------------------------------------------------
function cpu-temp() {
    cpu=$(</sys/class/thermal/thermal_zone0/temp)
    echo "$((cpu/1000)) c"
}
