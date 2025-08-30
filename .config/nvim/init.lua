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

-- extui
require("vim._extui").enable {
  enable = true, -- Whether to enable or disable the UI.
  msg = {        -- Options related to the message module.
    ---@type 'cmd'|'msg' Where to place regular messages, either in the
    ---cmdline or in a separate ephemeral message window.
    target = "msg",
    timeout = 4000, -- Time a message is visible in the message window.
  },
}
