#!/bin/bash

detect () {
  if pgrep -x "wl-screenrec" > /dev/null; then
    jo text=● tooltip="Left-click to stop recording"
  fi
}

record () {
  wl-screenrec -g "$(slurp)"
}

case "$1" in
  "detect")
    detect
    ;;

  "record")
    record
    ;;
esac
