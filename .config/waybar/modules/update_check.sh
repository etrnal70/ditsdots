#!/bin/sh
count="$(checkupdates | wc -l)"

if ["$count" = "0" ]; then
  echo ''
else
  notify-send -i info "📦 Package Updates Available" "$count packages can be updated"
  echo "$count 📦"
fi
