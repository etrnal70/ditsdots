#!/bin/sh
status="$(cat /sys/class/leds/input4::capslock/brightness)"

if [ "$status" = "1" ]; then 
  jo text="" tooltip="CapsLock is on"
else
  echo ''
fi
