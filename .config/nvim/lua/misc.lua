local set = vim.g

-- Supertab
set.SuperTabDefaultCompletionType = '<C-n>'

-- Vim-move
set.move_key_modifier = 'A-S'

-- Nvim-tree
set.lua_tree_side = 'left' 
set.lua_tree_width = 30 
set.lua_tree_ignore = { '.git', 'node_modules', '.cache' }
set.lua_tree_auto_open = 0 
set.lua_tree_auto_close = 0 
set.lua_tree_quit_on_open = 0 
set.lua_tree_follow = 1 
set.lua_tree_indent_markers = 1 
set.lua_tree_hide_dotfiles = 1 
set.lua_tree_git_hl = 1 
set.lua_tree_root_folder_modifier = ':~' 
set.lua_tree_tab_open = 1 
set.lua_tree_allow_resize = 1 
set.lua_tree_show_icons = {git =  0,folders = 1,files = 1}

set.lua_tree_bindings = {
    edit = {'<CR>', 'o'},
    edit_vsplit = '<C-v>',
    edit_split = '<C-x>',
    edit_tab = '<C-t>',
    toggle_ignored = 'I',
    toggle_dotfiles = 'H',
    refresh = 'R',
    preview = '<Tab>',
    cd = '<C-]>',
    create = 'a',
    remove = 'd',
    rename = 'r',
    cut = 'x',
    copy = 'c',
    paste = 'p',
    prev_git_item = '[c',
    next_git_item = ']c',
}

set.lua_tree_icons = {
  default = '',
  symlink =  '',
  git =  {
    unstaged =  "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★"
  },
  folder = {
    default = "",
    open = ""
  }
}

vim.cmd('nnoremap <F2> :LuaTreeToggle<CR>')
vim.cmd('highlight LuaTreeFolderIcon guifg=gray')

-- Colorizer.lua
local colorizer = require('colorizer')
colorizer.setup({'*';},{names = false; RRGGBBAA = true;})

-- gitsigns.nvim
require('gitsigns').setup{
  signs = {
    add          = {hl = 'DiffAdd'   , text = '│'},
    change       = {hl = 'DiffChange', text = '│'},
    delete       = {hl = 'DiffDelete', text = '_'},
    topdelete    = {hl = 'DiffDelete', text = '‾'},
    changedelete = {hl = 'DiffChange', text = '~'},
  }
}
