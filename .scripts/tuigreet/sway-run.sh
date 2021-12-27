#!/bin/sh

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway
export WLR_DRM_NO_MODIFIERS=1
# export WLR_RENDERER=vulkan

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

source /usr/local/bin/wayland_enablement.sh

systemd-cat --identifier=sway sway "$@"
