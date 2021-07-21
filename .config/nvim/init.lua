vim.opt.shadafile = "NONE"

-- Set <leader> to space
vim.g.mapleader = " "

-- Disable some builtin plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Import global vim config
require("config.global")

-- Plugins
require("config.plugins")

-- Theme
require("config.theme")

-- Telescope
require("config.telescope")

-- DAP Settings
-- require ("config.dap")

-- Test Framework Settings
require("config.test")

-- Git settings
require("config.git")

-- Keymapping
require("config.keymaps")

vim.opt.shadafile = ""
