local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
local packer = require 'packer'

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

return packer.startup(function(use)

  -- Plugin Manager
  use {'wbthomason/packer.nvim'}

  use {'dstein64/vim-startuptime'}

  -- LSP Plugins
  use {'neovim/nvim-lspconfig',
    requires = {
      'nvim-lua/lsp_extensions.nvim',
      'nvim-lua/lsp-status.nvim',
      'glepnir/lspsaga.nvim',
      'simrat39/symbols-outline.nvim',
      'ray-x/lsp_signature.nvim'
    }
  }

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'onsails/lspkind-nvim'
    }
  }

  -- Fuzzy-finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-bibtex.nvim'},
      {'GustavoKatel/telescope-asynctasks.nvim'}
    }
  }

  -- Theme and Icons
  use {'kyazdani42/nvim-web-devicons'}
  use {'mhartington/oceanic-next'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-tree-docs',
      'nvim-treesitter/playground',
      'p00f/nvim-ts-rainbow'
    },
    run = ':TSUpdate',
  }
  use {'vigoux/architext.nvim'}

  -- Git
  use {'lewis6991/gitsigns.nvim'}
  use {'tpope/vim-fugitive',
    keys = '<leader>gs'
  }
  use {'rhysd/git-messenger.vim',
    keys = '<leader>gm'
  }
  use {'rhysd/committia.vim',
    event = "BufEnter"
  }
  use {'ThePrimeagen/git-worktree.nvim'}

  -- Debugger
  use {'mfussenegger/nvim-dap',
    requires = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python"
    }
  }

  -- Testing and Runner
  use {'rcarriga/vim-ultest',
    requires = "vim-test/vim-test",
    run = ":UpdateRemotePlugins",
    cmd = {"Ultest","UltestNearest","UltestDebug","UltestDebugNearest","UltestOutput","UltestSummary"}
  }
  use {'skywind3000/asyncrun.vim',
    requires = {
      'skywind3000/asynctasks.vim'
    }
  }

  -- Language-related
  use {'akinsho/flutter-tools.nvim'}
  use {'simrat39/rust-tools.nvim'}
  use {'ray-x/go.nvim'}
  use {'megalithic/zk.nvim', ft = 'md'}
  use {'ziglang/zig.vim', ft = 'zig'}

  -- Misc
  use {'kristijanhusak/orgmode.nvim'}
  use {'antoinemadec/FixCursorHold.nvim'}
  use {'glepnir/galaxyline.nvim'}
  use {'glepnir/dashboard-nvim'}
  use {'folke/todo-comments.nvim'}
  use {'pwntester/octo.nvim',
    cmd = 'Octo',
    config = function()
      require('octo').setup()
    end
  }
  use {'tpope/vim-dadbod',
    requires = {'kristijanhusak/vim-dadbod-ui'},
    ft = 'sql'
  }
  use {'rmagatti/auto-session',
    requires = 'rmagatti/session-lens'
  }
  use {'windwp/nvim-autopairs'}
  use {'eugen0329/vim-esearch',
    keys = '<leader>ff'
  }
  use {'kevinhwang91/nvim-bqf'}
  use {'b3nj5m1n/kommentary'}
  use {'Pocco81/TrueZen.nvim'}
  use {'rktjmp/fwatch.nvim'}
  use {'gyim/vim-boxdraw',
    ft = {'markdown', 'text'}
  }
  use {'machakann/vim-sandwich'}
  use {'szw/vim-maximizer'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'matze/vim-move'}
end)
