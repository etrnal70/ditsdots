-- Set <leader> to space
vim.g.mapleader = " "

-- Plugins
require("config.plugins")

-- Load impatient plugin
require("impatient")

-- Theme
require("config.theme")

-- Keymapping
require("config.keymaps")

-- Autocommands
require("config.autocmds")

-- General neovim options
require("config.options")
