##########################################
# STARTUP CONTROL
##########################################
#Network Manager
exec --no-startup-id sudo NetworkManager
#default desktop
exec --no-startup-id ~/git/i3-configs/justlaptop.sh

#scaling of the i3 bars above the windows
exec_always  --no-startup-id xrandr --dpi 160

#wallpaper
exec_always --no-startup-id feh -z --bg-fill  ~/Pictures/Wallpapers/*

#START UP APPLICATIONS
exec --no-startup-id nm-applet
exec --no-startup-id pasystray
exec --no-startup-id blueman-applet
exec --no-startup-id xfce4-power-manager
exec --no-startup-id i3-msg 'workspace 6:EMail; exec thunderbird'
#exec --no-startup-id i3-msg 'workspace 5:Message; exec rambox'
exec --no-startup-id i3-msg 'workspace 7:Music; exec spotify'
exec --no-startup-id lrz-syncshare
exec_always --no-startup-id sudo xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1
exec_always --no-startup-id sudo xinput --map-to-output 9 eDP-1
exec --no-startup-id dropbox

##Startup Settings for Audio levels
exec --no-startup-id pactl -- set-sink-volume 0 15%
exec --no-startup-id pactl -- set-sink-volume 1 15%
exec --no-startup-id pactl -- set-sink-volume 2 15%

set $ws1 "1:Internet"
set $ws2 "2:Code"
set $ws3 "3:Code2"
set $ws4 "4:Files"
set $ws5 "5:Message"
set $ws6 "6:EMail"
set $ws7 "7:Music"
set $ws8 "8:Other1"
set $ws9 "9:Other2"
set $ws10 "10:Other3"


#MONITORS
workspace $ws1 output eDP1
workspace $ws2 output eDP1
workspace $ws3 output eDP1
workspace $ws4 output eDP1
workspace $ws5 output eDP1
workspace $ws6 output eDP1
workspace $ws7 output eDP1
workspace $ws8 output eDP1
workspace $ws9 output eDP1
workspace $ws10 output eDP1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
#font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 8

#### STARTUP FINISHED ####

set $mod Mod1 # Setting the mod button to ALTe

##########################################
# WORKSPACE MANAGEMENT
##########################################
# switch to workspace 
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

#workspaces on different monitors
bindsym $mod+Ctrl+Left move workspace to output left
bindsym $mod+Ctrl+Right move workspace to output right


#suspend bug fix hopefully
bindsym $mod+z exec xrandr --auto


#PROGRAM BINDS
bindsym $mod+c exec firefox
bindsym $mod+e exec nemo 
bindsym $mod+g exec gsimplecal 
bindsym $mod+Ctrl+c exec gnome-calculator

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec xfce4-terminal -e fish

# kill focused window
bindsym $mod+Shift+q kill

#taking screenshot of a selection and copying it to clipboard 
bindsym Print exec maim -so | xclip -selection clipboard -t image/png

#change keyboard configurations: 1 is normal, 2 is when you need accents
bindsym $mod+Ctrl+1 exec setxkbmap -model pc105 -layout us
bindsym $mod+Ctrl+2 exec setxkbmap -model pc105 -layout us -variant intl

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+t layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
#bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

#lock screen: change the 00 00 00 according to R G B colors to change the color
bindsym $mod+p exec i3lock -c 000000 -n

#set display mode
set $displayMode "Set display mode workOneScreen[1], laptopOnly[l], workTwoScreens[2]"
bindsym $mod+x mode $displayMode
mode $displayMode {
    bindsym l exec "\
        ~/git/i3-configs/justlaptop.sh"; \
        mode "default"
    
    bindsym 1 exec "\
        ~/git/i3-configs/work-justDP1-2.sh"; \
        mode "default"

    bindsym 2 exec "\
        ~/git/i3-configs/work-displays.sh"; \
        mode "default"

    bindsym Return mode "default"
    bindsym Escape mode "default"
}

#POWER
set $mode_system System (l) logout, (s) suspend, (h) hibernate, (r) reboot, (p) shutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id i3-msg exit, mode "default"
    bindsym s exec --no-startup-id lock && systemctl suspend, mode "default"
    bindsym h exec --no-startup-id systemctl hibernate, mode "default"
    bindsym r exec --no-startup-id systemctl reboot, mode "default"
    bindsym p exec --no-startup-id systemctl poweroff, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+o mode "$mode_system"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 5 px or 5 ppt
        bindsym Down resize grow height 5 px or 5 ppt
        bindsym Up resize shrink height 5 px or 5 ppt
        bindsym Right resize grow width 5 px or 5 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

##########################################
#AUDIO AND MEDIA PLAYER CONTROLS
##########################################

# Pulse Audio controls

#set $runningSink ~/git/i3-configs/findActiveSink.sh  #a script to find the active sink. Basically
# getting the speakers or the thunderbolt dock output

# by using physical buttons
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl -- set-sink-volume @DEFAULT_SINK@ +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl -- set-sink-volume @DEFAULT_SINK@ -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle # mute sound
#move the sink input
bindsym $mod+XF86AudioRaiseVolume exec pacmd move-sink-input 1 1 & ~/git/i3-configs/findActiveSink.sh
bindsym $mod+XF86AudioLowerVolume exec pacmd move-sink-input 1 0 & ~/git/i3-configs/findActiveSink.sh

##########SPOTIFY CONTROL##########

# Without using any physical specific buttons
bindsym $mod+n exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify\
 /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next # Next song
bindsym $mod+b exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify\
 /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous # Previous song
bindsym $mod+m exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle # mute sound
bindsym $mod+space exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify\
 /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause # Play or pause song

#in case the keyboard (or an external one) has play pause skip and previous buttons
bindsym XF86AudioPlay exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
bindsym XF86AudioNext exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
bindsym XF86AudioPrev exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous

##########################################
# I3BAR CONTROLS
##########################################
# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        
        status_command i3status
        tray_output primary

}