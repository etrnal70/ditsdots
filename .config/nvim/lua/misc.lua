local set = vim.g
local cmd = vim.cmd

local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end
-- TODO: Convert all keymap to lua ones

-- #####################################
-- #####         Keymapping        #####
-- #####################################
-- Switch active buffer with Ctrl + w + <hjkl>
cmd[[map sh <C-w>h]]
cmd[[map sk <C-w>k]]
cmd[[map sj <C-w>j]]
cmd[[map sl <C-w>l]]

-- Resize window using Ctrl + Alt + <hjkl>
cmd[[nnoremap <C-A-k> :resize +2<CR>]]
cmd[[nnoremap <C-A-j> :resize -2<CR>]]
cmd[[nnoremap <C-A-h> :vertical resize -2<CR>]]
cmd[[nnoremap <C-A-l> :vertical resize +2<CR>]]

-- Move one character left or right in insert mode
-- using Alt + <hl>
cmd[[inoremap <A-l> <esc>la]]
cmd[[inoremap <A-h> <esc>i]]

-- #####################################
-- #####         vim-move          #####
-- #####################################
-- Move line with Alt + Shift + <hjkl>
set.move_key_modifier = 'A-S'

-- #####################################
-- #####        Kommentary         #####
-- #####################################
-- Comment line/range using gc
-- For unsupported language, define it below
require('kommentary.config').config["rust"] = {"// ", {"/* ", " */"}}

-- #####################################
-- #####      vim-maximizer        #####
-- #####################################
-- Maxiize/minimize active buffer size
set.maximizer_set_default_mapping = 0
set.maximizer_set_mapping_with_bang = 0
cmd[[nnoremap <silent><leader>m :MaximizerToggle!<CR>]]
cmd[[vnoremap <silent><leader>m :MaximizerToggle!<CR>gv]]

-- #####################################
-- #####      nvim-autopairs       #####
-- #####################################
-- Auto closing bracket
require('nvim-autopairs').setup({
  pairs_map = {
    ["'"] = "'",
    ['"'] = '"',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['`'] = '`',
  },
  disable_filetype = {"TelescopePrompt"},
  break_line_filetype = nil,
  html_break_line_filetype = {'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'},
  ignored_nex_char = "%w",
})

-- #####################################
-- #####         Telescope         #####
-- #####################################
-- Ultimate lua-based fuzzy finder
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('frecency')

local tele = require('telescope')

vim.cmd[[noremap <silent><Leader>lf <cmd>lua require'telescope.builtin'.find_files({})<CR>]]
vim.cmd[[nnoremap <silent><Leader>lgf <cmd>lua require'telescope.builtin'.git_files({})<CR>]]
vim.cmd[[noremap <silent><Leader>ls <cmd>lua require'telescope.builtin'.live_grep({})<CR>]]
vim.cmd[[nnoremap <silent><Leader>lb <cmd>lua require'telescope.builtin'.buffers({initial_mode = "normal"})<CR>]]
vim.cmd[[nnoremap <silent><Leader>lt <cmd>lua require'telescope.builtin'.treesitter({})<CR>]]
vim.cmd[[nnoremap <silent><Leader>lq <cmd>lua require'telescope.builtin'.quickfix({initial_mode = "normal"})<CR>]]
vim.cmd[[nnoremap <silent><Leader>lh <cmd>lua require'telescope.builtin'.oldfiles({})<CR>]]
vim.cmd[[nnoremap <silent><Leader>lm <cmd>lua require'telescope.builtin'.marks({})<CR>]]
vim.cmd[[nnoremap <silent><Leader>lgc <cmd>lua require'telescope.builtin'.git_commits({})<CR>]]

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
    preview_cutoff = 120,
    windblend = 0.2,
    results_height = 1,
    results_width = 0.8,
    file_ignore_patterns = {"__pycache__/*","__init__.py", "%.env", "node_modules/*", "scratch/.*"},
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    set_env = {['COLORTERM'] = 'truecolor'},
    shorten_path = true,
    use_less = true,
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

vim.cmd('nnoremap <F2> :NvimTreeToggle<CR>')
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
    "c", "rust", "cpp",  "dart", "verilog", "bash", "toml" , "lua", "css", "html", "typescript", "javascript", "json"
  },
  -- Treesitter-based syntax highlighting
  highlight = {
    enable = true, 
    use_languagetree = true,
    disable = {},  
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
    enable = true,
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
    enable = false,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
}
-- Use treesitter fold capability (Still unstable, so disable for now)
-- vim.api.nvim_command('set foldmethod=expr')
-- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')


-- #####################################
-- #####        Vimspector         #####
-- #####################################
-- Python-based TUI debugger
cmd[[nnoremap <Leader>dd :call vimspector#Launch()<CR>]]
cmd[[nnoremap <Leader>de :call vimspector#Reset()<CR>]]
cmd[[nnoremap <Leader>dp :call vimspector#Pause()<CR>]]
cmd[[nnoremap <Leader>dl :call vimspector#StepInto()<CR>]]
cmd[[nnoremap <Leader>dj :call vimspector#StepOver()<CR>]]
cmd[[nnoremap <Leader>dk :call vimspector#StepOut()<CR>]]
cmd[[nnoremap <Leader>d_ :call vimspector#Restart()<CR>]]
cmd[[nnoremap <Leader>d<space> :call vimspector#Continue()<CR>]]
cmd[[nnoremap <Leader>dbp :call vimspector#ToggleBreakpoint()<CR>]]
cmd[[nnoremap <Leader>dbcp <Plug>VimspectorToggleConditionalBreakpoint]]
