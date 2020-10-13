export PATH="$HOME/.sdkman/bin/sdkman-init.sh"

# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Android SDK
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/tools/

# starship
eval "$(starship init bash)"

# fnm
export PATH="$HOME/.fnm:$PATH"
# fnm env --multi | source

# custom script
export PATH="$HOME/script:$PATH"

# pip path
export PATH="$HOME/.local/bin:$PATH"


# jEnv
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/.jenv/bin $PATH"
status --is-interactive; and source (jenv init -|psub)
eval (jenv init -)

# fzf
export FZF_DEFAULT_COMMAND='rg --hidden !.git -l ""'

# dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
