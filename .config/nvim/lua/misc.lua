local set = vim.g
local cmd = vim.cmd

local map = function(type, key, value)
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
map('n','<C-A-k>',[[<cmd>resize +2<CR>]])
map('n','<C-A-j>',[[<cmd>resize -2<CR>]])
map('n','<C-A-h>',[[<cmd>vertical resize +2<CR>]])
map('n','<C-A-l>',[[<cmd>vertical resize -2<CR>]])

-- Move one character left or right in insert mode
-- using Alt + <hl>
map('i','<A-l>',[[<esc>la]])
map('i','<A-h>',[[<esc>i]])

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
map('n','<leader>m',[[<cmd>MaximizerToggle!<CR>]])
map('v','<leader>gv',[[<cmd>MaximizerToggle!<CR>]])

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
require('telescope').load_extension('bibtex')
require('telescope').load_extension('gh')

local tele = require('telescope')

map('n','<leader>lf',[[<cmd>lua require'telescope.builtin'.find_files({})<CR>]])
map('n','<leader>ls',[[<cmd>lua require'telescope.builtin'.live_grep({})<CR>]])
map('n','<leader>lb',[[<cmd>lua require'telescope.builtin'.buffers({initial_mode = "normal"})<CR>]])
map('n','<leader>lt',[[<cmd>lua require'telescope.builtin'.treesitter({})<CR>]])
map('n','<leader>lc',[[<cmd>lua require'telescope.builtin'.tags({})<CR>]])
map('n','<leader>lq',[[<cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics({})<CR>]])
map('n','<leader>lo',[[<cmd>lua require'telescope.builtin'.oldfiles({})<CR>]])
map('n','<leader>lh',[[<cmd>lua require'telescope.builtin'.help_tags({})<CR>]])
map('n','<leader>lgf',[[<cmd>lua require'telescope.builtin'.git_files({})<CR>]])
map('n','<leader>lgc',[[<cmd>lua require'telescope.builtin'.git_commits({})<CR>]])
map('n','<leader>lmk',[[<cmd>lua require'telescope.builtin'.marks({})<CR>]])
map('n','<leader>lws',[[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols({})<CR>]])

local tele_get_width = function()
      local curwidth = vim.fn.winwidth(0)
      if curwidth > 150 then
        return "horizontal"
      else
        return "vertical"
      end
end

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
    layout_strategy = tele_get_width(),
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

map('n','<F2>',[[<cmd> NvimTreeToggle<CR>]])
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
-- #####        neuron.nvim        #####
-- #####################################
require'neuron'.setup {
  virtual_titles = true,
  mappings = true,
  run = nil,
  neuron_dir = "~/Data/Notes",
  leader = "gz"
}

-- #####################################
-- #####        Vimspector         #####
-- #####################################
-- Python-based TUI debugger
map('n','<leader>dd',[[<cmd> call vimspector#Launch()<CR>]])
map('n','<leader>de',[[<cmd> call vimspector#Reset()<CR>]])
map('n','<leader>dp',[[<cmd> call vimspector#Pause()<CR>]])
map('n','<leader>dl',[[<cmd> call vimspector#StepInto()<CR>]])
map('n','<leader>dj',[[<cmd> call vimspector#StepOver()<CR>]])
map('n','<leader>dk',[[<cmd> call vimspector#StepOut()<CR>]])
map('n','<leader>d_',[[<cmd> call vimspector#Restart()<CR>]])
map('n','<leader>d<space>',[[<cmd> call vimspector#Continue()<CR>]])
map('n','<leader>dbp',[[<cmd> call vimspector#ToggleBreakpoint()<CR>]])
-- cmd[[nnoremap <Leader>dd :call vimspector#Launch()<CR>]]
-- cmd[[nnoremap <Leader>de :call vimspector#Reset()<CR>]]
-- cmd[[nnoremap <Leader>dp :call vimspector#Pause()<CR>]]
-- cmd[[nnoremap <Leader>dl :call vimspector#StepInto()<CR>]]
-- cmd[[nnoremap <Leader>dj :call vimspector#StepOver()<CR>]]
-- cmd[[nnoremap <Leader>dk :call vimspector#StepOut()<CR>]]
-- cmd[[nnoremap <Leader>d_ :call vimspector#Restart()<CR>]]
-- cmd[[nnoremap <Leader>d<space> :call vimspector#Continue()<CR>]]
-- cmd[[nnoremap <Leader>dbp :call vimspector#ToggleBreakpoint()<CR>]]
cmd[[nnoremap <Leader>dbcp <Plug>VimspectorToggleConditionalBreakpoint]]
