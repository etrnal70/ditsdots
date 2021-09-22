-- Set <leader> to space
vim.g.mapleader = " "

-- Load impatient plugin
require("impatient")

-- General neovim options
require("config.global")

-- Theme
require("config.theme")

-- Plugins
require("config.plugins")
require("packer_compiled")
local packer_compiled = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua"
vim.api.nvim_command("luafile" .. packer_compiled)

-- DAP Settings
-- require ("config.dap")

-- Test Framework Settings
require("config.test")

-- Git settings
require("config.git")

-- Keymapping
require("config.keymaps")
