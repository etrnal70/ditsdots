#!/bin/sh
count="$(checkupdates | wc -l)"
zero=0

if [ "$count" -gt "$zero" ]; then
  notify-send -i info "📦 Package Updates Available" "$count packages can be updated" && \
  echo "$count 📦"
else
  echo ''
fi
