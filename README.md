# Ditsdots
## Restore dotfiles using git bare repo
[Inspiration](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

```  
alias df="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/etrnal70/ditsdots.git $HOME/.dotfiles  
df checkout  
df config --local status.showUntrackedFiles no  
```
# Setup
**WM** : sway-git + wlroots-git 
**Bar** : waybar
**Launcher** : wofi
**Shell** : zsh + Starship
**Terminal** : kitty + tmux  
**Editor** : neovim-git

![Desktop](https://github.com/etrnal70/ditsdots/blob/master/pic.png)
