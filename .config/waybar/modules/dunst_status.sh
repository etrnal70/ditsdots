#!/bin/sh

is_paused="$(dunstctl is-paused)"

if [ "$is_paused" == "true" ]; then
  echo '{"text":"","tooltip":"Notifications is paused","class":"$class"}'
else
  echo ''
fi
