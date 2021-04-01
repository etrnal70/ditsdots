local vim = vim
local set = vim.g
local cmd = vim.cmd

local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

-- #####################################
-- #####           Neogit          #####
-- #####################################
local neogit = require('neogit')

neogit.setup {
  disable_signs = false,
  signs = {
    section = {">", "v"},
    item = {">", "v"},
    hunk = {"", ""}
  }
}

map('n','<leader>gs','<cmd>Neogit kind=split<CR>')

-- #####################################
-- #####       git-messenger       #####
-- #####################################
-- Show commit details on current line/range
set.git_messenger_close_on_cursor_moved = true
set.git_messenger_include_diff = "current"
set.git_messenger_close_on_cursor_moved = false
set.git_messenger_into_popup_after_show = true
set.git_messenger_always_into_popup = true
set.git_messenger_max_popup_height = 20
set.git_messenger_max_popup_width = 50

-- #####################################
-- #####         GitSigns          #####
-- #####################################
-- Show modified line on signcolumn
require('gitsigns').setup{
  signs = {
    add          = {hl = 'DiffAdd'   , text = '│'},
    change       = {hl = 'DiffChange', text = '│'},
    delete       = {hl = 'DiffDelete', text = '│'},
    topdelete    = {hl = 'DiffDelete', text = '│'},
    changedelete = {hl = 'DiffChange', text = '│'},
  },
  sign_priority = 6,
  update_debounce = 250,
  use_decoration_api = true,
  use_internal_diff = true
}
