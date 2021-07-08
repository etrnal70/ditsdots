local set = vim.g
local gitsigns = require("gitsigns")

local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- #####################################
-- #####        vim-fugitive       #####
-- #####################################
gmap("n", "<leader>gs", "<cmd>:Git<CR>")
gmap("n", "<leader>gl", "<cmd>:Git log<CR>")
gmap("n", "<leader>gch", "<cmd>:diffget //2<CR>")
gmap("n", "<leader>gcl", "<cmd>:diffget //3<CR>")

-- TODO: Test this
vim.cmd(
  "command! -bang -bar -nargs=* Gpsuh execute 'AsyncRun -cwd=' . fnameescape(FugitiveGitDir()) 'git push' <q-args>"
)
vim.cmd(
  "command! -bang -bar -nargs=* Gfetch execute 'AsyncRun -cwd=' . fnameescape(FugitiveGitDir()) 'git fetch' <q-args>"
)

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
-- Git in-buffer extra functionality
gitsigns.setup({
  signs = {
    add = { hl = "DiffAdd", text = "│" },
    change = { hl = "DiffChange", text = "│" },
    delete = { hl = "DiffDelete", text = "│" },
    topdelete = { hl = "DiffDelete", text = "│" },
    changedelete = { hl = "DiffChange", text = "│" },
  },
  keymaps = {
    noremap = true,
    buffer = true,
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',

    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
  },
  watch_index = {
    interval = 1000,
  },
  sign_priority = 6,
  update_debounce = 250,
  status_formatter = nil,
  use_decoration_api = true,
  use_internal_diff = true,
})
