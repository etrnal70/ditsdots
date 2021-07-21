# Ditsdots
## Restore dotfiles using git bare repo
[Inspiration](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

```  
alias dfs="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/etrnal70/ditsdots.git $HOME/.dotfiles  
dfs checkout  
dfs config --local status.showUntrackedFiles no  
```
# Setup
**WM** : sway-git + wlroots-git  
**Bar** : waybar  
**Launcher** : wofi  
**Shell** : zsh + starship  
**Terminal** : alacritty + tmux  
**Editor** : neovim-git  

![Desktop](https://github.com/etrnal70/ditsdots/blob/master/pic.png)

# TODO (Race towards offline life)
 - [x] Waybar
   - [x] app title (remove it lol)
 - [ ] Wofi custom script
   - [ ] wshowkeys (if possible)
   - [ ] Toggle audio mute
   - [ ] Toggle mic mute
   - [ ] ???(????)
 - [ ] Setup neomutt/email
 - [x] Dunst volume (possibly more)
 - [ ] Wofi new style
 - [ ] Handle powerkey to suspend
 - [ ] usbguard (script remaining)
 - [ ] syncthing: enable only on ac power (acpid or udev)
 - [ ] Neovim (again and again)
   - [ ] Convert custom config to custom commands (CustTele, etc)
   - [x] setup fswatch (just wait for 0.6)
   - [x] telescope config
   - [ ] Setup asynctasks
   - [x] statusline path (missing truncation)
   - [ ] null-ls (mainly for md linting like vale and write-good, also hadolint)
   - [ ] Snippet (by order of importance)
     - [ ] Dart
     - [ ] Markdown
     - [ ] Golang
     - [ ] Latex
 - [ ] android sdk and flutter setup script
 - [ ] firefoxcss automated install
 - [ ] custom script folder
 - [ ] tmux script
 - [ ] Install script
 - [ ] More secure, enterprise-cy setup (btrfs automated snapshot,luks encryption, secure boot)
