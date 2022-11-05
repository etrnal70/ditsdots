#!/bin/sh

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_DESKTOP=Hyprland
export WLR_DRM_NO_MODIFIERS=1
export WLR_RENDERER=vulkan

source /usr/local/bin/wayland_enablement.sh
source /usr/local/bin/defaults.sh

systemd-cat --identifier=sway Hyprland "$@"
