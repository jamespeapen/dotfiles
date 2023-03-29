# vim:foldmethod=marker

# -------------------- LOCK {{{
# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
bindsym $mod+Shift+Escape \
    exec scrot -o -F /tmp/screenshot.png && \
    convert -scale 10% -scale 1000% /tmp/screenshot.png /tmp/pix.png && \
    dunstctl set-paused true && \
    i3lock -n -i /tmp/pix.png && dunstctl set-paused false

bindsym $mod+Escape exec idle_inhibitor
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock -c 000000 --nofork 
exec_always xautolock -time 5 -locker \
    "scrot -o -F /tmp/screenshot.png && convert -scale 10% -scale 1000% /tmp/screenshot.png /tmp/pix.png && dunstctl set-paused true && i3lock -n -i /tmp/pix.png && dunstctl set-paused false"
# }}}

# -------------------- NETWORK {{{
exec --no-startup-id nm-applet
# }}}

# -------------------- AUDIO {{{
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status
# }}}

# -------------------- BRIGHTNESS {{{
bindsym XF86MonBrightnessUp exec sudo /usr/bin/light -A 1 && $refresh_i3status
bindsym XF86MonBrightnessDown exec sudo /usr/bin/light -U 1 && $refresh_i3status
bindsym Shift+XF86MonBrightnessUp exec sudo /usr/bin/light -A 5 && $refresh_i3status
bindsym Shift+XF86MonBrightnessDown exec sudo /usr/bin/light -U 5 && $refresh_i3status
# }}}

# vim: set filetype=i3config :
