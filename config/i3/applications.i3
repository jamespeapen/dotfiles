bindsym $mod+Return exec kitty

# application menu
set $menu "rofi -combi-modi drun,ssh,run -show combi -show-icons"
bindsym $mod+d exec $menu

# emoji list
bindsym $mod+Shift+u exec dmenuunicode

# file browser
bindsym $mod+Shift+d exec rxvt -e 'spotlight'

# vim editor
bindsym $mod+Shift+Return exec vimmy

# screenshot
bindsym --release $mod+Shift+s exec screenshot
bindsym --release Mod1+Shift+f exec screenshot -f

# browser
bindsym Mod1+Shift+g exec firefox --private-window
bindsym Mod1+q exec ~/.local/bin/search
bindsym Mod1+Shift+q exec ~/.local/bin/search --clipboard
bindsym Mod1+Shift+s exec ~/.local/bin/search --selection
bindsym Mod1+Shift+p exec ~/.local/bin/search --pub

# pass
bindsym $mod+p exec /home/james.eapen/.local/bin/passmenu
bindsym $mod+o exec /home/james.eapen/.local/bin/otpmenu

# vim: set filetype=i3config :
