#!/bin/sh
count="$(notmuch search tag:unread | wc -l)"
count2="$(cat ~/.status/EMAIL_COUNT)"
zero=0

if [ "$count" -gt "$zero" ]; then
  echo '{"text": "'$count' 📬", "tooltip": "You have '$count' unread e-mail", "class": "$class"}'
else
  echo ''
fi
