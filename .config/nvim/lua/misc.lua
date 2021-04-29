local set = vim.g
local cmd = vim.cmd

local gmap = function(type, key, value)
	vim.api.nvim_set_keymap(type,key,value,{noremap = true, silent = true});
end

-- #####################################
-- #####         Keymapping        #####
-- #####################################
-- Switch active buffer with Ctrl + w + <hjkl>
cmd[[map sh <C-w>h]]
cmd[[map sk <C-w>k]]
cmd[[map sj <C-w>j]]
cmd[[map sl <C-w>l]]

-- Resize window using Ctrl + Alt + <hjkl>
gmap('n','<C-A-k>',[[<cmd>resize +2<CR>]])
gmap('n','<C-A-j>',[[<cmd>resize -2<CR>]])
gmap('n','<C-A-h>',[[<cmd>vertical resize +2<CR>]])
gmap('n','<C-A-l>',[[<cmd>vertical resize -2<CR>]])

-- Move one character left or right in insert mode
-- using Alt + <hl>
gmap('i','<A-l>',[[<esc>la]])
gmap('i','<A-h>',[[<esc>i]])

-- Goto file in vertical split
-- TODO: function to determine split based on window
-- width
cmd[[nnoremap <Leader><Leader>gf <C-w>vgf ]]
cmd[[nnoremap <Leader><Leader>gF <C-w>vgF ]]

-- #####################################
-- #####         vim-move          #####
-- #####################################
-- Move line with Alt + Shift + <hjkl>
set.move_key_modifier = 'A-S'

-- #####################################
-- #####        CursorHold         #####
-- #####################################
-- CursorHold bug workaround
set.cursorhold_updatetime = 100

-- #####################################
-- #####        Kommentary         #####
-- #####################################
-- Comment line/range using gc
local kommentary = require('kommentary.config')
kommentary.configure_language(
  "default",{
    prefer_multi_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true
  }
)
kommentary.configure_language(
  "lua",{
    prefer_single_line_comments = true,
    single_line_comment_string = "--",
    multi_line_comment_string = {"--[[", "]]"}
  }
)

-- #####################################
-- #####       auto-session        #####
-- #####################################
set.auto_session_enabled = 0
set.loaded_auto_session = 1

-- #####################################
-- #####     nvim-toggleterm       #####
-- #####################################
--
require"toggleterm".setup{
  size = 70,
  open_mapping = [[<C-A-\>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = false,
  direction = 'vertical'
}

-- #####################################
-- #####      vim-maximizer        #####
-- #####################################
-- Maxiize/minimize active buffer size
set.maximizer_set_default_mapping = 0
set.maximizer_set_mapping_with_bang = 0
gmap('n','<leader>m',[[<cmd>MaximizerToggle!<CR>]])
gmap('v','<leader>gv',[[<cmd>MaximizerToggle!<CR>]])

-- #####################################
-- #####      nvim-autopairs       #####
-- #####################################
-- Auto closing bracket
local npairs = require('nvim-autopairs')
npairs.setup({
  pairs_map = {
    ["'"] = "'",
    ['"'] = '"',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['`'] = '`',
  },
  disable_filetype = {"TelescopePrompt", "NvimTreeLua"},
  check_line_pair = true,
  break_line_filetype = nil,
  html_break_line_filetype = {'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'},
  ignored_next_char = "%w",
})

-- #####################################
-- #####         Telescope         #####
-- #####################################
-- Ultimate lua-based fuzzy finder
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('bibtex')
require('telescope').load_extension('gh')

local tele = require('telescope')
gmap('n','<leader>lf',[[<cmd>lua require'telescope.builtin'.find_files({})<CR>]])
gmap('n','<leader>ls',[[<cmd>lua require'telescope.builtin'.live_grep({})<CR>]])
gmap('n','<leader>lb',[[<cmd>lua require'telescope.builtin'.buffers({initial_mode = "normal"})<CR>]])
gmap('n','<leader>lt',[[<cmd>lua require'telescope.builtin'.treesitter({})<CR>]])
gmap('n','<leader>lc',[[<cmd>lua require'telescope.builtin'.tags({})<CR>]])
gmap('n','<leader>lq',[[<cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics({})<CR>]])
gmap('n','<leader>lo',[[<cmd>lua require'telescope.builtin'.oldfiles({})<CR>]])
gmap('n','<leader>lh',[[<cmd>lua require'telescope.builtin'.help_tags({})<CR>]])
gmap('n','<leader>lgf',[[<cmd>lua require'telescope.builtin'.git_files({})<CR>]])
gmap('n','<leader>lgc',[[<cmd>lua require'telescope.builtin'.git_commits({})<CR>]])
gmap('n','<leader>lmk',[[<cmd>lua require'telescope.builtin'.marks({})<CR>]])

tele.setup{
  defaults = {
    extensions = {
      frecency = {
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = {"*.git/*", "*/tmp/*", "node_modules/*"},
      },
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    },
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    prompt_prefix= " 🔍 ",
    color_devicons = true,
    layout_strategy = "flex",
    preview_cutoff = 140,
    windblend = 0.2,
    results_height = 1,
    results_width = 0.8,
    file_ignore_patterns = {"__pycache__/*","__init__.py", "%.env", "node_modules/*", "scratch/.*"},
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    set_env = {['COLORTERM'] = 'truecolor'},
    shorten_path = true,
    use_less = false,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<esc>"] = require('telescope.actions').close,
      },
    },
  }
}

-- #####################################
-- #####       nvim-tree.lua       #####
-- #####################################
-- Lua-based directory tree
set.nvim_tree_side = 'left'
set.nvim_tree_width = 20
set.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '__pycache__' }
set.nvim_tree_auto_open = 0
set.nvim_tree_auto_close = 0
set.nvim_tree_quit_on_open = 0
set.nvim_tree_follow = 1
set.nvim_tree_indent_markers = 1
set.nvim_tree_hide_dotfiles = 0
set.nvim_tree_git_hl = 0
set.nvim_tree_root_folder_modifier = ':~'
set.nvim_tree_tab_open = 1
set.nvim_tree_allow_resize = 1
set.nvim_tree_show_icons = {git =  0,folders = 1,files = 1}

set.nvim_tree_bindings = {
    edit = '<CR>',
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

set.nvim_tree_icons = {
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
gmap('n','<F2>',[[<cmd> NvimTreeToggle<CR>]])
vim.cmd('highlight NvimTreeFolderIcon guifg=gray')

-- #####################################
-- #####         Colorizer         #####
-- #####################################
-- Color highlighting support
local colorizer = require('colorizer')
colorizer.setup({'*';},{names = false; RRGGBBAA = true;})

-- #####################################
-- #####        Treesitter         #####
-- #####################################
-- Next generation syntax parser
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
     "bash","bibtex","c","cpp","css", "dart","go","rust","html","javascript","json","latex","lua","toml","python","typescript","verilog","yaml","zig"
  },
  -- Treesitter-based syntax highlighting
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>"
    }
  },
  -- Treesitter-based docstring generator
  -- TODO: Configure it
  tree_docs = {
    enable = false
  },
  -- Treesitter-based refactoring function
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  -- Treesitter-based indentation
  indent = {
    enable = false,
  },
  -- Custom-defined textobjects
  textobjects = {
    select = {
      enable = true,
        keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["as"] = "@statement.outer",
        ["am"] = "@statement.outer",
        }
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  -- See treesitter details. For development only
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}
