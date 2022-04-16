#!/bin/bash

entries=$(cat ~/.scripts/commandlist)
script=~/.scripts

selected=$(echo -e "$entries" | rofi -dmenu -config "$HOME/.config/rofi/theme.rasi" -i)

case $selected in
  "Audio Mute Toggle")
    exec $script/volume.sh mute
    ;;
  "Mic Mute Toggle")
    exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    ;;
  "Touchscreen Toggle")
    exec $script/input_toggle.sh touchscreen toggle
    ;;
  "Touchpad Toggle")
    exec $script/input_toggle.sh touchpad
    ;;
  "Screenshot")
    exec grim -g "$(slurp)" - | wl-copy
    ;;
  "Screenrecord")
    exec wf-recorder -g "$(slurp)"
    ;;
  "Restart Kanshi")
    exec systemctl --user restart kanshi
    ;;
  "Restart Pipewire")
    exec systemctl --user daemon-reload
    exec systemctl --user restart pipewire.socket pipewire-pulse.socket
    ;;
esac
