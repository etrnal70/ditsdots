-- Set global to space
vim.g.mapleader = " "

-- Import global vim config
require("config.global")

-- Plugins
require("config.plugins")

-- Theme
require("config.theme")

-- Telescope
require("config.telescope")

-- LSP Settings
require("config.lsp")

-- DAP Settings
-- require ("config.dap")

-- Test Framework Settings
require("config.test")

-- Git settings
require("config.git")

-- Miscellaneous plugin configs
require("config.plugin_config")

-- Keymapping
require("config.keymaps")
