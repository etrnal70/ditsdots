# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep notify
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hanifrmdhn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zsh plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/z.lua/z.lua.plugin.zsh
zstyle ':autocomplete:tab:*' widget-style menu-complete
zstyle ':autocomplete:list-choices:*' min-input 3
zstyle ':autocomplete:list-choices:*' max-lines 20% 

# Default
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$PATH
export LC_ALL="en_US.UTF-8"

# Starship
eval "$(starship init zsh)"

# fnm
eval "$(fnm env)"

# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Android SDK
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/tools/

# jEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export JAVA_OPTS=""

# custom script
export PATH="$HOME/.config/script:$PATH"

# pip
export PATH="$HOME/.local/bin:$PATH"

# Ruby
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# CMake
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

#Python lib
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

# nnn
export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:preview-tabbed;v:vidthumb;i:imgview;'
export NNN_FIFO=/tmp/nnn.fifo

# Wayland related
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1

# FzF
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --theme=OneHalfDark --color=always --style=header,grid,numbers,snip --line-range :300 {}' --height 60%"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ditsdots
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias nvc="nvim -u ~/.config/nvim/fallback.vim"
alias cls="clear"
alias gpo="git push origin"
alias wifi-menu="nmtui-connect"
# Manual trigger for WebRTC screensharing
alias webrtcss="/usr/lib/xdg-desktop-portal -r"
