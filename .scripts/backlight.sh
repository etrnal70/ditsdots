#!/bin/bash

# Dependencies
# - brightnessctl
# - ePapirus (icon)

msgID="92375"
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
  dunstify "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-full -r $msgID
elif [ "$value" -gt "65" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-high -r $msgID
elif [ "$value" -gt "30" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-medium -r $msgID
elif [ "$value" -gt "0" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-low -r $msgID
elif [ "$value" == "0" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i notification-display-brightness-off -r $msgID
fi
