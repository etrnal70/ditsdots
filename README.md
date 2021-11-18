# Ditsdots

## Restore dotfiles using git bare repo

[Inspiration](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

```bash
alias dfs="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/etrnal70/ditsdots.git $HOME/.dotfiles  
dfs checkout  
dfs config --local status.showUntrackedFiles no  
```

## Setup

**WM** : sway-git + wlroots-git  
**Bar** : waybar  
**Launcher** : wofi  
**Shell** : zsh + starship  
**Terminal** : alacritty + tmux  
**Editor** : neovim-git  

![Desktop](https://github.com/etrnal70/ditsdots/blob/master/pic.png)
