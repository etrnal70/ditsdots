# Ditsdots
Thanks to [this](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html) i finally fix my dots.

## Restoring
```  
alias -s dotfiles="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/etrnal70/ditsdots.git $HOME/.dotfiles  
dotfiles checkout  
dotfiles config --local status.showUntrackedFiles no  
```

## TODO
- [ ] Moar README
- [ ] Arch install script
- [x] Full migration to native LSP
- [x] Port neovim config to Lua


# Setup
**DE** : sway-git  
**Shell** : zsh  
**Terminal** : kitty + tmux  
**Editor** : neovim  

