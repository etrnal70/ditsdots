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
use {'neovim/nvim-lspconfig'}           -- Neovim LSP Configuration
use {'nvim-lua/lsp_extensions.nvim'}    -- LSP Custom Extension (Rust and Dart)
use {'RishabhRD/nvim-lsputils',         -- Extra functionality for LSP
  requires = {'RishabhRD/popfix', run = "./install_fzy_native_sorter"}
}
use {'stevearc/aerial.nvim'}
use {'nvim-lua/lsp-status.nvim'}

-- Completion
use {
  'hrsh7th/nvim-compe',
  requires = {
    'hrsh7th/vim-vsnip',              -- Snippet support
    'hrsh7th/vim-vsnip-integ',
    'onsails/lspkind-nvim'
  }
}

-- Fuzzy-finder
use {
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/popup.nvim',    -- Telescope requirement
    'nvim-lua/plenary.nvim',  -- Telescope requirement
    'nvim-telescope/telescope-fzy-native.nvim',   -- fzy algorithm support
    {'nvim-telescope/telescope-frecency.nvim', requires = {'tami5/sql.nvim'}},  -- Frecency algorithm support
    'nvim-telescope/telescope-bibtex.nvim',
    'nvim-telescope/telescope-github.nvim'
  }
}

-- Theme and Icons
use {'mhinz/vim-startify'}
use {'kyazdani42/nvim-web-devicons'}
use {'mhartington/oceanic-next'}

-- Treesitter
use {'nvim-treesitter/nvim-treesitter',
  requires = {
    'nvim-treesitter/nvim-treesitter-textobjects',  -- Define custom textobjects
    'nvim-treesitter/nvim-treesitter-refactor',     -- Refactoring
    'nvim-treesitter/nvim-tree-docs',               -- Docstring generator
    'nvim-treesitter/playground',                   -- See treesitter details
  },
  run = function() vim.cmd [[TSUpdate]] end,
}
use {'vigoux/architext.nvim'}                       -- TS-based structural editing

-- Git
use {'lewis6991/gitsigns.nvim'}   -- Gutter sign
use {'tpope/vim-fugitive'}        -- Integrated git function wrapper
use {'TimUntersberger/neogit',    -- Magit port for neovim
  requires = {'nvim-lua/plenary.nvim'}
}
use {'rhysd/git-messenger.vim'}   -- Show commit message in floating win
use {'rhysd/committia.vim'}       -- Show diff in commit buffer

-- Debugger
use {'puremourning/vimspector',   -- Python based TUI debugger
  ft = {'rust', 'c', 'cpp', 'javascript', 'typescript'}
}
use {'mfussenegger/nvim-dap'}     -- Basic debug adapter protocol implementation

-- Language-related
use {'sheerun/vim-polyglot'}            -- Fallback for highlighting
use {'akinsho/flutter-tools.nvim'}      -- Flutter development extensions
use {'ziglang/zig.vim'}

-- Misc
use {'glepnir/galaxyline.nvim'}         -- Statusline
use {'tpope/vim-dadbod',                -- Database capability
  requires = {'kristijanhusak/vim-dadbod-ui'}
}
use {'oberblastmeister/neuron.nvim',    -- neuron note-taking integration
  branch = "unstable"
}
use {'windwp/nvim-autopairs'}           -- Autopair
use {'eugen0329/vim-esearch'}           -- Project wide search-and-replace
use {'b3nj5m1n/kommentary'}             -- Commentary plugin
-- use 'tpope/vim-dispatch'              -- Async job control
-- use 'tpope/vim-tbone'                 -- tmux wrapper
use {'gyim/vim-boxdraw',
  ft = "markdown"
}
use {'machakann/vim-sandwich'}          -- Surround plugin
use {'szw/vim-maximizer'}               -- Maximize buffer
use {'mhartington/formatter.nvim'}      -- Formatter
use {'lervag/vimtex', ft = 'tex'}       -- AiO TeX plugin
use 'norcalli/nvim-colorizer.lua'       -- Color highlighting
use {'kyazdani42/nvim-tree.lua'}        -- Directory tree
use {'jsfaint/gen_tags.vim',            -- Generate gtags
  cmd = {'GenCtags', 'GenGtags'}
}
use {'matze/vim-move'}                  -- To move lines easily
use {'mhinz/vim-crates', ft = 'toml'}   -- Get updated Rust crates version
use {'jbyuki/instant.nvim'}             -- Collaborative editing without ext dependencies
use {'rafcamlet/nvim-luapad',           -- REPL for Lua development
  ft = 'lua'
}
use {'bfredl/nvim-luadev',              -- For lua development in Neovim
  ft = 'lua'
}
end)
