#!/bin/bash

# Dependencies
# - pamixer
# - pactl
# - ePapirus (icon)

msgID="92374"
appname="system_info"

case "$1" in
  "up")
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;

  "down")
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;

  "mute")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

isMuted="$(pamixer --get-mute)"
volume="$(pamixer --get-volume)"

if [ "$isMuted" = "false" ]; then
  if [ "$volume" -gt "100" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -h string:fgcolor:#ff4444 -h string:frcolor:#ff4444 -i /notification-audio-volume-high -r $msgID -a $appname
  elif [ "$volume" -gt "65" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-high -r $msgID -a $appname
  elif [ "$volume" -gt "20" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-medium -r $msgID -a $appname
  elif [ "$volume" -gt "0" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-low -r $msgID -a $appname
  elif [ "$volume" == "0" ]; then
    dunstify "Volume Muted" -i notification-audio-volume-muted -r $msgID -a $appname
  fi
else
  dunstify "Volume Muted" -i notification-audio-volume-muted -r $msgID -a $appname
fi

canberra-gtk-play -i audio-volume-change -d "changeVolume"
