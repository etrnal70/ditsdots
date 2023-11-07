#!/bin/bash

file=/tmp/screenshot_$(date +%d%m%Y_%N).png
output=$(swaymsg -t get_outputs --raw | jq -r '.[] | .name')
len=$(echo -e "$output" | wc -l)

if [ "$len" -gt "1" ]; then
  selected=$(echo -e "Full\nOutput\nRegion" | fuzzel --dmenu)
else
  selected=$(echo -e "Full\nRegion" | fuzzel --dmenu)
fi

region () {
    grim -l 2 -g "$(slurp)" "$file"
    wl-copy < "$file"
    if [ -f "$file" ]; then
      notify-send.sh "Screenshot" "Screenshot saved at $file" --icon="$file"
    fi
}

full () {
    grim -l 2 -c "$file"
    wl-copy < "$file"
    if [ -f "$file" ]; then
      notify-send.sh "Full Screenshot" "Screenshot saved at $file" --icon="$file"
    fi
}

output () {
  output=$(swaymsg -t get_outputs --raw | jq -r '.[] | .name' | fuzzel --dmenu)
  grim -l 2 -c -o "$output" "$file"
  wl-copy < "$file"
  if [ -f "$file" ]; then
    notify-send.sh "Screenshot $output" "Screenshot saved at $file" --icon="$file"
  fi
}

case $selected in
  "Output")
    output
    ;;
  "Region")
    region
    ;;
  "Full")
    full
    ;;
esac

