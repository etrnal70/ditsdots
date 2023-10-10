#!/bin/sh
# TODO If wifi turned off, dont print offline
if ping -c 3 -i 0.3 8.8.8.8 &> /dev/null; then
  echo ""
else
  jo text="Offline"
fi
