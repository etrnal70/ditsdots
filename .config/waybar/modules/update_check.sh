#!/bin/sh
count="$(checkupdates | wc -l)"
zero=0

if [ "$count" -gt "$zero" ]; then
  notify-send -i info "📦 Package Updates Available" "$count packages can be updated" && \
  echo '{"text":'$count',"tooltip":"'$count' packages can be updated","class":"$class"}'
else
  echo ''
fi
