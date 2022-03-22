-- Set <leader> to space
vim.g.mapleader = " "

-- Plugins
require("config.plugins")

-- General neovim options
require("config.options")

-- Load impatient plugin
require("impatient")

-- Theme
require("config.theme")

-- Keymapping
require("config.keymaps")
