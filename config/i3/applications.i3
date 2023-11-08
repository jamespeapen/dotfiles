bindsym $mod+Return exec kitty

# application menu
set $menu "rofi -combi-modi window,drun,ssh,run -show combi -show-icons -drun-match-fields name"
bindsym $mod+d exec $menu

# emoji list
bindsym $mod+Shift+u exec dmenuunicode

# file browser
bindsym $mod+Shift+d exec rxvt -e 'spotlight'

# zotero browser
bindsym $mod+Shift+p exec rxvt -e 'pgf'

# vim editor
bindsym $mod+Shift+Return exec vimmy

# screenshot
bindsym --release F9 exec screenshot
bindsym --release Mod1+F9 exec screenshot -f

# browser
bindsym Mod1+Shift+g exec firefox --private-window
bindsym $mod+Shift+f exec rxvt -e bkmrks

# search
bindsym Mod1+q exec search
bindsym Mod1+s exec search --selection
bindsym Mod1+Shift+s exec search --clipboard

# pass
bindsym $mod+p exec passmenu
bindsym $mod+o exec otpmenu

# warpd
bindsym Mod1+o exec warpd --hint --oneshot --click 1

# bindings
bindsym Mod1+Shift+n [class="kitty" title="neomutt"] focus
bindsym Mod1+Shift+o [class="kitty" title="weechat"] focus

# settings
for_window [class="URxvt"] floating enable, border pixel 0
for_window [class="R_x11"] floating enable

for_window [title="neomutt"] layout splitv
assign [title="neomutt"] $ws7
assign [title="weechat"] $ws7

assign [title="Neovide"] $ws8
for_window [title="Neovide"] layout tabbed

# vim: set filetype=i3config :
