-- Set <leader> to space
vim.g.mapleader = " "

-- Disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- General neovim options
require "config.options"

-- Plugins
require "config.plugins"

-- Theme
require "config.theme"

-- Keymapping
require "config.keymaps"

-- Autocommands
require "config.autocmds"
