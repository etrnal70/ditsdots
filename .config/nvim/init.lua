-- Set <leader> to space
vim.g.mapleader = " "

-- General neovim options
require("config.global")

-- Plugins
require("config.plugins")

-- Load impatient plugin
require("impatient")

-- Theme
require("config.theme")

-- Keymapping
require("config.keymaps")
