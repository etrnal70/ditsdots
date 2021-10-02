#!/bin/bash

token=$(cat ~/.config/github/notifications.token)
count=$(curl -u etrnal70:"$token" https://api.github.com/notifications | jq '. | length')

if [[ "$count" != "0" ]]; then
  echo '{"text":"'$count'   ","tooltip":"You have '$count' GitHub notifications","class":"$class"}'
fi
