# Ditsdots
Thanks to [this](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html) i finally fix my dots.

## Restoring
'''
alias -s dotfiles="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/etrnal70/ditsdots.git $HOME/.dotfiles  
dotfiles checkout  
dotfiles config --local status.showUntrackedFiles no  
'''

## TODO
- [] Moar README
- [] restore script
- [] vimspector debug script
- [] Post-install script
- [] Minimal vim script for C/C++ low-level use


# Setup
**DE** : Gnome 3.38 + pop_shell tiling  
**Shell** : zsh  
**Terminal** : kitty + tmux  
**Editor** : neovim  

