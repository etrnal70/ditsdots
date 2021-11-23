repo_dir:
	@mkdir -p ~/Repo

usbguard:
	# TODO: Autodetech user
	sudo usbguard add-user hanifrmdhn -d listen
	sudo systemctl enable --now usbguard
	systemctl --user enable --now usbguard-notifier

greeter:
	echo "Linking greetd config files..."
	@ln -sfnv ~/.scripts/tuigreet/sway-run.sh /usr/local/bin/sway-run.sh
	@ln -sfnv ~/.scripts/tuigreet/wayland_enablement.sh /usr/local/bin/wayland_enablement.sh
	@ln -sfnv ~/.scripts/tuigreet/config.toml /etc/greetd/config.toml
	echo "Linking greetd config files: \033[0;32mDONE"

dunst:
	echo "Setting up dunst..."
	@cd ~/Repo
	@git clone https://github.com/dunst-project/dunst.git && cd dunst
	@make && sudo make install
	echo "Setting up dunst: \033[0;32mDONE"

neovim:
	echo "Setting up neovim..."
	@cd ~/Repo
	@git clone https://github.com/neovim/neovim.git && cd neovim
	@make distclean && make CMAKE_BUILD_TYPE=Release && sudo make install
	@git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	@nvim --headless +PackerSync +qa
	echo "Setting up neovim: \033[0;32mDONE"

user_service:
	echo "Setting up user service..."
	@systemctl --user add-wants sway-session.target autostart.target kanshi.service waybar.service xsettingsd.service dunst.service
	@systemctl --user add-wants autostart.target keepassxc.service telegram.service kdeconnect.service ssh-agent.service
	@systemctl --user enable --now kdeconnect
	@systemctl --user enable --now keepassxc
	@systemctl --user enable --now ssh-agent
	@systemctl --user enable --now kanshi
	@systemctl --user enable --now waybar
	@systemctl --user enable --now dunst
	@systemctl --user enable --now xsettingsd
	echo "Setting up user service: \033[0;32mDONE"
