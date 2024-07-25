bindsym $mod+Return exec kitty

# application menu
set $menu "rofi -combi-modi window,drun,ssh,run -show combi -show-icons -drun-match-fields name"
bindsym $mod+d exec $menu

# emoji list
bindsym $mod+Shift+u exec dmenuunicode

# file browser
bindsym $mod+Shift+d exec kitty --class flykitty 'spotlight'

# zotero browser
bindsym $mod+Shift+p exec flykitty 'zotcli'

# calculator
bindsym $mod+Shift+c exec flykitty 'numbat'

# vim editor
bindsym $mod+Shift+Return exec vimmy

# screenshot
mode "screenshot" {
    bindsym --release c exec screenshot; mode "default"
    bindsym --release f exec screenshot -f; mode "default"

    bindsym Escape mode "default"
    bindsym Return mode "default"
}
bindsym Mod1+F9 mode "screenshot"

# browser

mode "browser" {
    bindsym i exec firefox --private-window; mode "default"
    bindsym b exec firefox; mode "default"
    bindsym y exec firefox --private-window youtube.com; mode "default"
    bindsym o exec firefox 'https://outlook.office.com/mail'; mode "default"
    bindsym c exec firefox 'https://outlook.office.com/calendar'; mode "default"
    bindsym $mod+i [class="firefox" title=".*Private Browsing$"] focus; mode "default"
    bindsym $mod+b [class="firefox" title=".*Mozilla Firefox$"] focus; mode "default"
    bindsym f exec flykitty bkmrks; mode "default"

    bindsym Escape mode "default"
    bindsym Return mode "default"
}
bindsym $mod+b mode "browser"

# search
mode "search" {
    bindsym q exec search; mode "default"
    bindsym s exec search --selection; mode "default"
    bindsym c exec search --clipboard; mode "default"
    bindsym p exec search --pub; mode "default"

    bindsym Escape mode "default"
    bindsym Return mode "default"
}
bindsym Mod1+q mode "search"

# pass
mode "pass" {
    bindsym p exec passmenu; mode "default"
    bindsym o exec otpmenu; mode "default"

    bindsym Escape mode "default"
    bindsym Return mode "default"
}
bindsym $mod+p mode "pass"

# warpd
bindsym Mod1+o exec warpd --hint --oneshot --click 1

# bindings
bindsym Mod1+Shift+n [class="kitty" title="neomutt"] focus
bindsym Mod1+Shift+o [class="kitty" title="weechat"] focus

# settings
for_window [class="URxvt"] floating enable, border pixel 0
for_window [class="R_x11"] floating enable
for_window [class="flykitty"] floating enable, border pixel 0

for_window [title="neomutt"] layout splitv
assign [title="neomutt"] $ws7
assign [title="weechat"] $ws7

assign [title="Neovide"] $ws8
for_window [title="Neovide"] layout tabbed

# vim: set filetype=i3config :
