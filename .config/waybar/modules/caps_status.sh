#!/bin/sh

dev="$(find /sys/class/leds | grep capslock | head -n 1)"
status="$(cat "$dev"/brightness)"

if [ "$status" = "1" ]; then 
  jo text="" tooltip="CapsLock is on"
else
  echo ''
fi
