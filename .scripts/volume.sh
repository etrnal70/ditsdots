#!/bin/bash

# Dependencies
# - notify-send.sh
# - pamixer
# - pactl
# - ePapirus (icon)

appname="system_info"
file=/tmp/volume_notification

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
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -h string:fgcolor:#ff4444 -h string:frcolor:#ff4444 -i /notification-audio-volume-high -a $appname
  elif [ "$volume" -gt "65" ]; then
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-high -a $appname
  elif [ "$volume" -gt "20" ]; then
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-medium -a $appname
  elif [ "$volume" -gt "0" ]; then
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-low -a $appname
  elif [ "$volume" == "0" ]; then
    notify-send.sh --replace-file=$file "Volume Muted" -i notification-audio-volume-muted -a $appname
  fi
else
  notify-send.sh --replace-file=$file "Volume Muted" -i notification-audio-volume-muted -a $appname
fi

canberra-gtk-play -i audio-volume-change -d "changeVolume"
