local vim = vim
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")

  return
end

return require('packer').startup(function()

  -- Plugin Manager
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP Plugins
  use 'neovim/nvim-lspconfig'           -- Neovim LSP Configuration
  use 'nvim-lua/lsp_extensions.nvim'    -- LSP Custom Extension (Rust and Dart)
  use {'RishabhRD/nvim-lsputils',       -- Extra functionality for LSP
    requires = {'RishabhRD/popfix', run = "./install_fzy_native_sorter"}
  } 
  
  -- Completion
  -- Note : Currently nvim-compe give the best result as of now
  -- Watching both plugins development
  use {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',              -- Snippet support
      'hrsh7th/vim-vsnip-integ'
    } 
  } 
  -- use {
  --   'nvim-lua/completion-nvim',  
  --   requires = {
  --     'hrsh7th/vim-vsnip',              -- Snippet support
  --     'hrsh7th/vim-vsnip-integ',
  --     'steelsojka/completion-buffers',           -- Buffer as completion source
  --     'nvim-treesitter/completion-treesitter',   -- Treesitter as completion source
  --     'kristijanhusak/vim-dadbod-completion',    -- Database completion for vim-dadbod
  --   } 
  -- } 

  -- Fuzzy-finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim', 
      'nvim-telescope/telescope-fzy-native.nvim',
      {'nvim-telescope/telescope-frecency.nvim', requires = {'tami5/sql.nvim'}},
    }
  }

  -- Theme and Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'jsit/toast.vim'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',  -- Define custom textobjects
      'nvim-treesitter/nvim-treesitter-refactor',     -- Refactoring 
      'nvim-treesitter/nvim-tree-docs'                -- Docstring generator
    },
    run = function() vim.cmd [[TSUpdate]] end,
  }
  use 'vigoux/architext.nvim'                         -- TS-based structural editing

  -- Documentation
  use 'kkoomen/vim-doge'

  -- Git
  use 'lewis6991/gitsigns.nvim'   -- Gutter sign
  -- use 'tpope/vim-fugitive'        -- Integrated git function wrapper
  use 'lambdalisue/gina.vim'      -- Async git wrapper
  use 'rhysd/git-messenger.vim'   -- Show commit message in floating win
  use 'rhysd/committia.vim'       -- Show diff in commit buffer
  -- use 'pwntester/octo.nvim'       -- GitHub integration
  use 'junegunn/gv.vim'           -- Visualize git log

  -- Debugger
  use 'puremourning/vimspector'   -- Python based TUI debugger
  -- use {'mfussenegger/nvim-dap' -- Basic debug adapter protocol implementation
  --   requires = {
  --     'theHamsta/nvim-dap-virtual-text'
  --   }
  -- }

  -- Language-related
  use 'akinsho/flutter-tools.nvim'
  use 'dart-lang/dart-vim-plugin'
  use 'cespare/vim-toml'
  use 'ziglang/zig.vim'

  -- Misc
  use 'glepnir/galaxyline.nvim'         -- Statusline
  use {'tpope/vim-dadbod',              -- Database capability
    requires = {'kristijanhusak/vim-dadbod-ui'}
  }   
  use 'tpope/vim-commentary'            -- Commentary plugin
  use 'tpope/vim-dispatch'              -- Async job control
  use 'machakann/vim-sandwich'          -- Surround plugin
  use 'szw/vim-maximizer'               -- Maximize buffer
  use {
    'iamcco/markdown-preview.nvim',
    run = {"cd app && npm install"},
  }
  use 'mhartington/formatter.nvim'       -- Formatter
  use {'lervag/vimtex', ft = 'tex'}     -- AiO TeU plugin
  use 'norcalli/nvim-colorizer.lua'     -- Color highlighting
  use {'kyazdani42/nvim-tree.lua',      --  Directory tree
    event = 'VimEnter *'  --SRPEAD THE UGANDAN MESSAGE
  } 
  use 'jsfaint/gen_tags.vim'            -- Generate gtags
  use 'matze/vim-move'                  -- To move lines easily
  use {'mhinz/vim-crates', ft = 'toml'} -- Get updated Rust crates version
  use 'rafcamlet/nvim-luapad'           -- REPL for Lua dev
  use 'bfredl/nvim-luadev'              -- For lua development in Neovim
end
)
