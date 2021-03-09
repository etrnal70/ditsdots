local set = vim.g
local cmd = vim.cmd

-- #####################################
-- #####         gina.vim          #####
-- #####################################


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
}
