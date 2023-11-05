#!/bin/bash

file=/tmp/libinput-toggle
touch_toggle() {
  STATUS=$(swaymsg -t get_inputs -r | jq -r '.[] | select(.type=="touch") | .libinput.send_events')
  if [[ "$STATUS" == "disabled" ]]; then
    swaymsg input type:touch events toggle
    notify-send.sh --replace-file=$file "Touchscreen Input" "Enabled" -i mouse-touchpad-clicking
  elif [[ "$STATUS" == "enabled" ]]; then
    swaymsg input type:touch events toggle
    notify-send.sh --replace-file=$file "Touchscreen Input" "Disabled" -i mouse-touchpad-clicking
  fi
}

touchpad_toggle() {
  STATUS=$(swaymsg -t get_inputs -r | jq -r '.[] | select(.type=="touchpad") | .libinput.send_events')
  if [[ "$STATUS" == "disabled" ]]; then
    swaymsg input type:touchpad events enabled
    notify-send.sh --replace-file=$file "Touchpad" "Enabled" -i input-touchpad-on
  elif [[ "$STATUS" == "enabled" ]]; then
    swaymsg input type:touchpad events disabled
    notify-send.sh --replace-file=$file "Touchpad" "Disabled" -i input-touchpad-off
  elif [[ "$STATUS" = "disabled_on_external_mouse" ]]; then
    notify-send.sh --replace-file=$file "Touchpad" "Disabled on external mouse" -i input-touchpad-off
  fi
}

case "$1" in
  "touchscreen")
    touch_toggle
    ;;

  "touchpad")
    touchpad_toggle
    ;;
esac
