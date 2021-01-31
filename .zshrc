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

# Generate zcompdump once a day
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C
# End of lines added by compinstall
 
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit wait lucid light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    marlonrichert/zsh-autocomplete

### End of Zinit's installer chunk


# zinit plugin config
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':autocomplete:*' min-input 2
zstyle ':completion:*' verbose no

# Default
export PATH=/usr/local/bin:/usr/bin:$PATH
export LC_ALL="en_US.UTF-8"
 
# Starship
eval "$(starship init zsh)"
 
# fnm
eval "$(fnm env)"

# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"
 
# Android SDK
export ANDROID_HOME=$HOME/Development/android_sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin:$PATH

# Flutter
export PATH=$PATH:$HOME/Repo/flutter/bin:$PATH
 
# jEnv
export JENV_ROOT="${JENV_ROOT:=${HOME}/.jenv}"
if ! type jenv > /dev/null && [ -f "${JENV_ROOT}/bin/jenv" ]; then
    export PATH="${JENV_ROOT}/bin:${PATH}"
    export JAVA_OPTS=""
fi

if type jenv > /dev/null; then
    export PATH="${JENV_ROOT}/bin:${JENV_ROOT}/shims:${PATH}"
    function jenv() {
        unset -f jenv
        eval "$(jenv init -)"
        jenv $@
    }
fi
 
# custom script
export PATH="$HOME/.config/script:$PATH"
 
# pip
export PATH="$HOME/.local/bin:$PATH"
 
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
export LIBVA_DRIVER_NAME=i965 # Workaround for buggy NEO driver
 
# FzF
export FZF_DEFAULT_OPTS="--ansi --height 40% --layout=reverse --border"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
 
# Misc
export OPENCV_LOG_LEVEL=ERROR
export EDITOR=nvim
 
# ditsdots
alias df="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias cfnv="cd ~/.config/nvim && nvim"
alias ls="exa -l"
alias nvc="nvim -u ~/.config/nvim/fallback.vim"
alias cls="clear"
alias gpo="git push origin"
alias wifi-menu="nmtui-connect"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Ultralist
alias u="ultralist"
alias uc="ultralist l due:agenda group:context"
alias up="ultralist l due:agenda group:project"
alias tod="ultralist l group:project due:tod"
alias tom="ultralist l group:project due:tom"
alias mon="ultralist l group:project due:mon"
alias tue="ultralist l group:project due:tue"
alias wed="ultralist l group:project due:wed"
alias thu="ultralist l group:project due:thu"
alias fri="ultralist l group:project due:fri"
alias c="ultralist l completed:tod"

# Manual trigger for WebRTC screensharing
alias webrtcss="/usr/lib/xdg-desktop-portal -r"
