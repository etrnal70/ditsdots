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
source /usr/share/zsh/plugins/zsh-notify/notify.plugin.zsh
source /usr/share/z.lua/z.lua.plugin.zsh
zstyle ':autocomplete:tab:*' widget-style menu-complete
zstyle ':autocomplete:list-choices:*' min-input 3
zstyle ':autocomplete:list-choices:*' max-lines 20% 
zstyle ':notify:*' activate-terminal no

# Default
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$PATH

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
export PATH="$HOME/script:$PATH"

# pip
export PATH="$HOME/.local/bin:$PATH"

# CMake
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

# FzF Keybinding
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ditsdots
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias nv="nvim"
alias nvmin="nvim -u ~/.config/nvim/mini.vim"
