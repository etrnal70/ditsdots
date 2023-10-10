HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep notify
setopt autocd
bindkey -v

# compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit

## Generate zcompdump once a day
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

function osc7 {
    setopt localoptions extendedglob
    input=( ${(s::)PWD} )
    uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
    print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}
add-zsh-hook -Uz chpwd osc7

## zinit plugins
zinit wait lucid light-mode for \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  ael-code/zsh-colored-man-pages \
  tj/git-extras

## zinit plugin config
zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' verbose no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666,bold,italic"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="git *"

# Default
export PATH=/usr/local/bin:/usr/bin:$HOME/.local/bin:$PATH
export LC_ALL="en_US.UTF-8"

# custom script
export PATH=$PATH:$HOME/.scripts

# libva driver
export LIBVA_DRIVER_NAME=iHD

# Starship
eval "$(starship init zsh)"

# fnm
eval "$(fnm env)"

# zoxide
eval "$(zoxide init zsh)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# export RUSTC_WRAPPER=sccache

# Golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# SDK Collection
export SDK_HOME=$HOME/.sdk_dir

# Chromium depot-tools
export PATH=$PATH:$SDK_HOME/depot_tools

# Kotlin
export PATH=$PATH:$SDK_HOME/kotlin/bin

# Android SDK
export ANDROID_HOME=$SDK_HOME/android_sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export NDK_HOME=$ANDROID_HOME/ndk/25.0.8775105

# Dart
export PATH=$PATH:$HOME/.pub-cache/bin

# Flutter
export PATH=$PATH:$HOME/.sdk_dir/flutter/bin
# export CHROME_EXECUTABLE=/usr/bin/chromium

# CMake
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

# extra lib
# export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/include
# export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=/usr/local/lib64/:$LD_LIBRARY_PATH
unset LD_LIBRARY_PATH

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/usr/local/share/pkgconfig:$PKG_CONFIG_PATH

# FZF
export FZF_DEFAULT_OPTS="--ansi --height 40% --layout=reverse --border=none"
# source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Misc
export OPENCV_LOG_LEVEL=ERROR
export EDITOR=nvim
export PRETTIERD_DEFAULT_CONFIG=$HOME/.config/nvim/.prettierrc.json

# Source alias file
source $HOME/.config/aliasrc

# pnpm
export PNPM_HOME="/home/hanifrmdhn/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# bun
[ -s "/home/hanifrmdhn/.bun/_bun" ] && source "/home/hanifrmdhn/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
