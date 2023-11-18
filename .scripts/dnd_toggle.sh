#!/bin/bash

STATUS=$(swaync-client -D)

if [[ "$STATUS" = "false" ]]; then
  swaync-client -dn
  gsettings set org.gnome.desktop.sound event-sounds false
elif [[ "$STATUS" = "true" ]]; then
  swaync-client -df
  gsettings set org.gnome.desktop.sound event-sounds true
fi
