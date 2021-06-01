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

return require('packer').startup(function(use)

  -- Plugin Manager
  use {'wbthomason/packer.nvim'}

  -- LSP Plugins
  use {'neovim/nvim-lspconfig'}           -- Neovim LSP Configuration
  use {'nvim-lua/lsp_extensions.nvim'}    -- LSP Custom Extension (Rust and Dart)
  use {'nvim-lua/lsp-status.nvim'}
  use {'glepnir/lspsaga.nvim'}
  use {'simrat39/symbols-outline.nvim'}
  use {'folke/lsp-trouble.nvim'}
  use {'ray-x/lsp_signature.nvim'}

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
      'nvim-telescope/telescope-bibtex.nvim',
      'nvim-telescope/telescope-github.nvim'
    }
  }

  -- Theme and Icons
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
    run = ":TSUpdate",
  }
  use {'vigoux/architext.nvim'}                       -- TS-based structural editing

  -- Git
  use {'lewis6991/gitsigns.nvim'}   -- Gutter sign
  use {'tpope/vim-fugitive'}        -- Integrated git function wrapper
  use {'rhysd/git-messenger.vim'}   -- Show commit message in floating win
  use {'rhysd/committia.vim'}       -- Show diff in commit buffer
  use {'ThePrimeagen/git-worktree.nvim'}

  -- Debugger
  use {'mfussenegger/nvim-dap',     -- Lua-based debugger
    requires = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python"
    }
  }

  -- Testing and Runner
  use {'rcarriga/vim-ultest',
    requires = "vim-test/vim-test",
    run = ":UpdateRemotePlugins"
  }
  use {'skywind3000/asyncrun.vim',
    requires = {
      'skywind3000/asynctasks.vim'
    }
  }

  -- Language-related
  use {'akinsho/flutter-tools.nvim'}      -- Flutter development extensions
  use {'simrat39/rust-tools.nvim'}        -- Rust-analyzer development extensions
  use {'megalithic/zk.nvim'}
  use {'ziglang/zig.vim', ft = 'zig'}

  -- Misc
  use {'antoinemadec/FixCursorHold.nvim'} -- Workaround for CursorHold bug
  use {'akinsho/nvim-toggleterm.lua'}     -- Terminal addons
  use {'numToStr/Navigator.nvim'}
  use {'glepnir/galaxyline.nvim'}         -- Statusline
  use {'glepnir/dashboard-nvim'}
  use {'tpope/vim-dadbod',                -- Database capability
    requires = {'kristijanhusak/vim-dadbod-ui'},
    ft = 'sql'
  }
  use {'rmagatti/auto-session',
    requires = 'rmagatti/session-lens'
  }
  use {'windwp/nvim-autopairs'}           -- Autopair
  use {'eugen0329/vim-esearch'}           -- Project wide search-and-replace
  use {'kevinhwang91/nvim-bqf'}
  use {'soywod/himalaya.vim'}
  use {'b3nj5m1n/kommentary'}             -- Commentary plugin
  use {'kdav5758/TrueZen.nvim'}
  use {'rktjmp/fwatch.nvim'}
  use {'gyim/vim-boxdraw',
    ft = "markdown"
  }
  use {'machakann/vim-sandwich'}
  use {'szw/vim-maximizer'}               -- Maximize buffer
  use 'norcalli/nvim-colorizer.lua'       -- Color highlighting
  use {'kyazdani42/nvim-tree.lua'}        -- Directory tree
  use {'jsfaint/gen_tags.vim',            -- Generate gtags
    cmd = {'GenCtags', 'GenGtags'}
  }
  use {'matze/vim-move'}                  -- To move lines easily
end)
