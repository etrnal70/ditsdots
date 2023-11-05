#!/bin/bash

entries=$(cat ~/.scripts/commandlist)
script=~/.scripts

selected=$(echo -e "$entries" | fuzzel --dmenu)

case $selected in
  "Audio Mute Toggle")
    exec $script/volume.sh mute
    ;;
  "Bluetooth Toggle")
    exec $script/bt_toggle.sh
    ;;
  "Color Picker")
    exec hyprpicker --autocopy
    ;;
  "Lock Screen")
    exec swaylock -f
    ;;
  "Mic Mute Toggle")
    exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    ;;
  "Output Toggle")
    exec $script/output_toggle.sh
    ;;
  "Touchscreen Toggle")
    exec $script/input_toggle.sh touchscreen toggle
    ;;
  "Touchpad Toggle")
    exec $script/input_toggle.sh touchpad
    ;;
  "Turbo Boost Toggle")
    exec $script/turbo_toggle.sh
    ;;
  "Screenshot")
    exec $script/screenshot.sh
    ;;
  "Screenrecord")
    exec $script/screenrecord.sh record
    ;;
  "Restart Kanshi")
    exec kanshictl reload
    ;;
  "Restart Pipewire")
    exec systemctl --user daemon-reload
    exec systemctl --user restart pipewire.socket pipewire-pulse.socket
    ;;
  "Suspend")
    exec systemctl suspend
    ;;
  "Power Off")
    exec systemctl poweroff
    ;;
esac
