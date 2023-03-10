#!/bin/bash

# Dependencies
# - notify-send.sh
# - brightnessctl
# - ePapirus (icon)

file=/tmp/backlight_notification

case "$1" in
  "up")
    brightnessctl s +5%
    ;;

  "down")
    brightnessctl s 5%-
    ;;
esac

value="$(brightnessctl -m | awk -F, '{print $4}' | tr -d %)"

if [ "$value" -gt "90" ]; then
  notify-send.sh --replace-file=$file "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-full
elif [ "$value" -gt "65" ]; then
  notify-send.sh --replace-file=$file "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-high
elif [ "$value" -gt "30" ]; then
  notify-send.sh --replace-file=$file "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-medium
elif [ "$value" -gt "0" ]; then
  notify-send.sh --replace-file=$file "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-low
elif [ "$value" == "0" ]; then
  notify-send.sh --replace-file=$file "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-off
fi
