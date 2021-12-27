-- Set <leader> to space
vim.g.mapleader = " "

-- General neovim options
require("config.global")

-- Plugins
require("config.plugins")
local packer_compiled = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
vim.api.nvim_command("luafile" .. packer_compiled)
require("packer_compiled")

-- Load impatient plugin
require("impatient")

-- Theme
require("config.theme")

-- DAP Settings
require("config.dap")

-- Git settings
require("config.git")

-- Keymapping
require("config.keymaps")
