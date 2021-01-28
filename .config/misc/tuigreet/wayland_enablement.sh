#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export CLUTTER_BACKEND=wayland
export QT_QPA_PLATFORM=wayland-egl
export _JAVA_AWT_WM_NONPARENTING=1
