local set = vim.g

set.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache__", "build" }
set.nvim_tree_gitignore = 0
set.nvim_tree_auto_ignore_ft = { "alpha" }
set.nvim_tree_quit_on_open = 0
set.nvim_tree_indent_markers = 1
set.nvim_tree_hide_dotfiles = 0
set.nvim_tree_git_hl = 0
set.nvim_tree_highlight_opened_files = 1
set.nvim_tree_root_folder_modifier = ":~"
set.nvim_tree_add_trailing = 1
set.nvim_tree_group_empty = 1
set.nvim_tree_disable_window_picker = 0
set.nvim_tree_icon_padding = " "
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

require("nvim-tree").setup({
  view = {
    auto_resize = true,
  },
})
