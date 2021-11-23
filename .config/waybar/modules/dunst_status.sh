#!/bin/sh

is_paused="$(dunstctl is-paused)"

if [ "$is_paused" = "true" ]; then
  jo text= tooltip="Notifications is paused"
else
  echo ''
fi
