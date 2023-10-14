#!/bin/bash

FILE=~/.config/github/gitlab_notifications.token

if [ -f "$FILE" ]; then
  token=$(cat $FILE)
  count=$(curl --header "PRIVATE-TOKEN: $token" https://gitlab.com/api/v4/issues?state=opened | jq '. | length')
  
  if [[ "$count" != "0" ]]; then
    jo text="$count" tooltip="You have $count GitLab notifications"
  fi
fi
