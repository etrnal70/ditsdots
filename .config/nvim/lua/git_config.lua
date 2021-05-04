local vim = vim
local set = vim.g

local gmap = function(type, key, value)
	vim.api.nvim_set_keymap(type,key,value,{noremap = true, silent = true});
end

-- #####################################
-- #####        vim-fugitive       #####
-- #####################################
gmap("n", "<leader>gs", "<cmd>:Git<CR>")
gmap("n", "<leader>gl", "<cmd>:Git log<CR>")
gmap("n", "<leader>gch", "<cmd>:diffget //2<CR>")
gmap("n", "<leader>gcl", "<cmd>:diffget //3<CR>")

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
-- #####       diffview.nvim       #####
-- #####################################
local cb = require('diffview.config').diffview_callback
require('diffview').setup {
  diff_binaries = false,
  file_panel = {
    width = 35,
    use_icons = true
  },
  key_bindings = {
    view = {
      ["<tab>"]     = cb("select_next_entry"),
      ["<s-tab>"]   = cb("select_prev_entry"),
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files"),
    },
    file_panel = {
      ["j"]         = cb("next_entry"),
      ["<down>"]    = cb("next_entry"),
      ["k"]         = cb("prev_entry"),
      ["<up>"]      = cb("prev_entry"),
      ["<cr>"]      = cb("select_entry"),
      ["o"]         = cb("select_entry"),
      ["R"]         = cb("refresh_files"),
      ["<tab>"]     = cb("select_next_entry"),
      ["<s-tab>"]   = cb("select_prev_entry"),
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files")
    }
  }
}

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
