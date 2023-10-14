#!/bin/bash

FILE=~/.config/github/notifications.token

if [ -f "$FILE" ]; then
  token=$(cat $FILE)
  count=$(curl -s -u etrnal70:"$token" https://api.github.com/notifications | jq '. | length')
  
  if [[ "$count" != "0" ]]; then
    jo text="$count " tooltip="You have $count GitHub notifications"
  fi
fi
