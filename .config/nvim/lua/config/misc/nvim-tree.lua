local set = vim.g

local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- #####################################
-- #####       nvim-tree.lua       #####
-- #####################################
-- Lua-based directory tree
set.nvim_tree_side = "left"
set.nvim_tree_width = 30
set.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache__", "build" }
set.nvim_tree_gitignore = 0
set.nvim_tree_auto_open = 0
set.nvim_tree_auto_close = 0
set.nvim_tree_auto_ignore_ft = { "dashboard" }
set.nvim_tree_quit_on_open = 0
set.nvim_tree_follow = 1
set.nvim_tree_indent_markers = 1
set.nvim_tree_hide_dotfiles = 0
set.nvim_tree_git_hl = 0
set.nvim_tree_highlight_opened_files = 1
set.nvim_tree_root_folder_modifier = ":~"
set.nvim_tree_tab_open = 1
set.nvim_tree_auto_resize = 1
set.nvim_tree_disable_netrw = 1
set.nvim_tree_hijack_netrw = 1
set.nvim_tree_add_trailing = 1
set.nvim_tree_group_empty = 1
set.nvim_tree_lsp_diagnostics = 0
set.nvim_tree_disable_window_picker = 0
set.nvim_tree_hijack_cursor = 1
set.nvim_tree_icon_padding = " "
set.nvim_tree_update_cwd = 1
set.nvim_tree_disable_keybindings = 0
set.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
}
set.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
  },
  folder = {
    default = "",
    open = "",
  },
}

gmap("n", "<leader>st", [[<cmd> NvimTreeToggle<CR>]])
vim.cmd("highlight NvimTreeFolderIcon guifg=gray")
