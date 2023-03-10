#!/bin/bash
touchscreenID="92370"
touchpadID="92371"
touch_toggle() {
  STATUS=$(swaymsg -t get_inputs -r | jq '.[] | select(.type=="touch") | .libinput.send_events' | tr -d \")
  if [[ "$STATUS" == "disabled" ]]; then
    swaymsg input type:touch events toggle
    notify-send "Touchscreen Input" "Enabled" -i mouse-touchpad-clicking -r $touchscreenID
  elif [[ "$STATUS" == "enabled" ]]; then
    swaymsg input type:touch events toggle
    notify-send "Touchscreen Input" "Disabled" -i mouse-touchpad-clicking -r $touchscreenID
  fi
}

touchpad_toggle() {
  STATUS=$(swaymsg -t get_inputs -r | jq '.[] | select(.identifier=="1739:33521:SYNA3071:00_06CB:82F1_Touchpad") | .libinput.send_events' | tr -d \")
  if [[ "$STATUS" == "disabled" ]]; then
    swaymsg input type:touchpad events enabled
    notify-send "Touchpad" "Enabled" -i input-touchpad-on -r $touchpadID
  elif [[ "$STATUS" == "enabled" ]]; then
    swaymsg input type:touchpad events disabled
    notify-send "Touchpad" "Disabled" -i input-touchpad-off -r $touchpadID
  elif [[ "$STATUS" = "disabled_on_external_mouse" ]]; then
    notify-send "Touchpad" "Disabled on external mouse" -i input-touchpad-off -r $touchpadID
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
