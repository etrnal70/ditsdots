#!/bin/bash

# TODO: Screenshot, screenrecord, one-time paste, more

entries="Audio Mute Toggle\nMic Mute Toggle\nRestart Kanshi\nRestart Waybar"

selected=$(echo -e "$entries" | wofi --dmenu --style=$HOME/.config/wofi/style.css)

case $selected in
  "Audio Mute Toggle")
    exec ~/.config/script/volume.sh mute
    ;;
  "Mic Mute Toggle")
    exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    ;;
  "Restart Kanshi")
    exec systemctl --user restart kanshi
    ;;
  "Restart Waybar")
    exec systemctl --user restart waybar
    ;;
esac
