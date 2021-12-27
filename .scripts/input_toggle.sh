#!/bin/bash

touchscreenID="92370"
touchpadID="92371"
case "$1" in
  "touchscreen")
    STATUS=$(swaymsg -t get_inputs -r | jq '.[] | select(.type=="touch") | .libinput.send_events' | tr -d \")
    if [[ "$STATUS" == "disabled" ]]; then
      swaymsg input type:touch events toggle
      dunstify "Touchscreen Input" "Enabled" -i mouse-touchpad-clicking -r $touchscreenID
    elif [[ "$STATUS" == "enabled" ]]; then
      swaymsg input type:touch events toggle
      dunstify "Touchscreen Input" "Disabled" -i mouse-touchpad-clicking -r $touchscreenID
    fi
    ;;

  "touchpad")
    STATUS=$(swaymsg -t get_inputs -r | jq '.[] | select(.identifier=="1739:33521:SYNA3071:00_06CB:82F1_Touchpad") | .libinput.send_events' | tr -d \")
    if [[ "$STATUS" == "disabled" ]]; then
      swaymsg input type:touchpad events enabled
      dunstify "Touchpad" "Enabled" -i input-touchpad-on -r $touchpadID
    elif [[ "$STATUS" == "enabled" ]]; then
      swaymsg input type:touchpad events disabled
      dunstify "Touchpad" "Disabled" -i input-touchpad-off -r $touchpadID
    elif [[ "$STATUS" = "disabled_on_external_mouse" ]]; then
      dunstify "Touchpad" "Disabled on external mouse" -i input-touchpad-off -r $touchpadID
    fi
    ;;
esac
