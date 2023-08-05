bindsym $mod+Return exec kitty

# application menu
set $menu "rofi -combi-modi drun,ssh,run -show combi -show-icons"
bindsym $mod+d exec $menu

# emoji list
bindsym $mod+Shift+u exec dmenuunicode

# file browser
bindsym $mod+Shift+d exec urxvt -e 'spotlight'

# zotero browser
bindsym $mod+Shift+p exec urxvt -e 'pgf'

# vim editor
bindsym $mod+Shift+Return exec vimmy

# screenshot
bindsym --release $mod+Shift+s exec screenshot
bindsym --release Mod1+Shift+f exec screenshot -f

# browser
bindsym Mod1+Shift+g exec firefox --private-window
bindsym $mod+Shift+f exec urxvt -e bkmrks
bindsym Mod1+q exec search
bindsym Mod1+Shift+q exec search --clipboard
bindsym Mod1+Shift+s exec search --selection
bindsym Mod1+Shift+p exec search --pub

# pass
bindsym $mod+p exec passmenu
bindsym $mod+o exec otpmenu

# warpd
bindsym Mod1+o exec warpd --hint

# vim: set filetype=i3config :
