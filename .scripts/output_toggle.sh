#!/bin/bash

file=/tmp/output_toggle

outputs=$(swaymsg -t get_outputs --raw | jq -r '.[] | .name')
len=$(echo -e "$outputs" | wc -l)

if [ "$len" -gt "1" ]; then
  selected=$(echo -e "$outputs" | fuzzel --dmenu)
  if [ "$selected" != "" ]; then
    swaymsg output "$selected" toggle
    notify-send.sh --replace-file=$file "Output Control" "Toggling output $selected" -i video-display
  fi
else
  notify-send.sh --replace-file=$file "Output Control" "There's only a single output" -i video-display
fi
