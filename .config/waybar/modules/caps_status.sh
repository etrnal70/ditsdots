#!/bin/sh
status="$(cat /sys/class/leds/input4::capslock/brightness)"

if [ "$status" = "1" ]; then 
  echo '⚠️ ' 
else
  echo ''
fi
