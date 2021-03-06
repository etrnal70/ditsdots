# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep notify
setopt autocd
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
export PATH=/usr/local/bin:/usr/bin:$HOME/.local/bin:$PATH
export LC_ALL="en_US.UTF-8"

# Starship
eval "$(starship init zsh)"

# fnm
eval "$(fnm env)"

# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Golang
export PATH="$HOME/go/bin:$PATH"

# Android SDK
export ANDROID_HOME=$HOME/.sdk_dir/android_sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Flutter
export PATH=$PATH:$HOME/.sdk_dir/flutter/bin
export CHROME_EXECUTABLE=/usr/bin/chromium

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

# zoxide
eval "$(zoxide init zsh)"

# custom script
export PATH=$PATH:$HOME/.config/script

# CMake
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

#Python lib
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

# FzF
export FZF_DEFAULT_OPTS="--ansi --height 40% --layout=reverse --border"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Misc
export OPENCV_LOG_LEVEL=ERROR
export EDITOR=nvim

# ditsdots
alias dfs="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Miscellaneous
alias cfnv="cd ~/.config/nvim && nvim"
alias ls="exa"
alias cls="clear"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# tmux
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tks='tmux kill-server'
