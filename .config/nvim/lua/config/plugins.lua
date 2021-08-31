local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
local packer = require("packer")

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(out)
  print("Downloading packer.nvim...")

  return
end

return packer.startup(function(use)
  -- Plugin Manager
  use({ "wbthomason/packer.nvim" })

  -- stdlib
  use({ "nvim-lua/plenary.nvim" })

  -- LSP Plugins
  use({ "glepnir/lspsaga.nvim" })
  use({ "nvim-lua/lsp_extensions.nvim" })
  use({ "nvim-lua/lsp-status.nvim" })
  use({ "simrat39/symbols-outline.nvim" })
  use({ "ray-x/lsp_signature.nvim" })
  use({
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("config.lsp")
    end,
  })

  -- Completion
  use({ "windwp/nvim-autopairs" })
  use({ "hrsh7th/vim-vsnip" })
  use({ "hrsh7th/vim-vsnip-integ" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-vsnip" })
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.lsp.cmp")
    end,
  })

  -- Fuzzy-finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-bibtex.nvim" },
      { "GustavoKatel/telescope-asynctasks.nvim" },
      { "crispgm/telescope-heading.nvim" },
    },
  })

  -- Theme and Icons
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "etrnal70/oceanic-next" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  })
  use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter" })
  use({ "nvim-treesitter/nvim-treesitter-refactor", requires = "nvim-treesitter" })
  use({ "nvim-treesitter/playground", requires = "nvim-treesitter" })
  use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter" })
  use({
    "danymat/neogen",
    requires = "nvim-treesitter",
    config = function()
      require("neogen").setup({
        enabled = true,
      })
    end,
  })
  use({
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter",
    config = function()
      require("nvim-gps").setup()
    end,
  })
  use({ "vigoux/architext.nvim", opt = true })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.git.gitsigns")
    end,
  })
  use({ "tpope/vim-fugitive" })
  use({
    "rhysd/git-messenger.vim",
    keys = "<leader>gm",
    config = function()
      vim.g.git_messenger_close_on_cursor_moved = true
      vim.g.git_messenger_include_diff = "current"
      vim.g.git_messenger_close_on_cursor_moved = false
      vim.g.git_messenger_into_popup_after_show = true
      vim.g.git_messenger_always_into_popup = true
      vim.g.git_messenger_max_popup_height = 20
      vim.g.git_messenger_max_popup_width = 50
      vim.g.git_messenger_floating_win_opts = {
        border = "single",
      }
      vim.g.git_messenger_popup_content_margins = true
    end,
  })
  use({ "rhysd/committia.vim" })
  use({ "ThePrimeagen/git-worktree.nvim", opt = true })

  -- Debugger
  use({
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
    },
  })

  -- Testing and Runner
  use({
    "rcarriga/vim-ultest",
    requires = "vim-test/vim-test",
    run = ":UpdateRemotePlugins",
  })
  use({
    "skywind3000/asyncrun.vim",
    requires = { "skywind3000/asynctasks.vim" },
    config = function()
      require("config.misc.asynctasks")
    end,
  })

  -- Language-related
  use({ "akinsho/flutter-tools.nvim", opt = true })
  use({ "simrat39/rust-tools.nvim", opt = true })
  use({ "ray-x/go.nvim", opt = true })
  use({ "folke/lua-dev.nvim", opt = true })
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- Misc
  use({ "lewis6991/impatient.nvim" }) -- Remove after neovim/pull/15436 merged
  use({
    "glepnir/dashboard-nvim",
    config = function()
      require("config.misc.dashboard")
    end,
  })
  use({
    "famiu/feline.nvim",
    requires = { "SmiteshP/nvim-gps" },
    config = function()
      vim.cmd("PackerLoad lsp-status.nvim")
      require("config.misc.feline")
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("config.misc.nvim-bufferline")
    end,
  })
  use({
    "vhyrro/neorg",
    branch = "unstable",
    requires = "vhyrro/neorg-telescope",
    config = function()
      require("config.misc.neorg")
    end,
  })
  use({
    "folke/todo-comments.nvim",
    config = function()
      require("config.misc.todo-comments")
    end,
  })
  use({
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = function()
      require("octo").setup()
    end,
  })
  use({ "tpope/vim-dadbod", requires = { "kristijanhusak/vim-dadbod-ui" }, ft = "sql" })
  use({ "eugen0329/vim-esearch", keys = "<leader>ff" })
  use({ "b3nj5m1n/kommentary" })
  use({ "gyim/vim-boxdraw", opt = true })
  use({ "machakann/vim-sandwich" })
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, { names = false, RRGGBBAA = true })
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("config.misc.nvim-tree")
    end,
  })
  use({
    "NTBBloodbath/rest.nvim",
    opt = true,
    config = function()
      require("rest-nvim").setup()
    end,
  })
end)
