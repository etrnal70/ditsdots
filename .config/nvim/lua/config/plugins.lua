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
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })

  -- LSP Plugins
  use({ "glepnir/lspsaga.nvim", opt = true })
  use({ "simrat39/symbols-outline.nvim", opt = true })
  use({ "nvim-lua/lsp-status.nvim", opt = true })
  use({ "ray-x/lsp_signature.nvim", opt = true })
  use({
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    config = function()
      vim.cmd("PackerLoad lspsaga.nvim symbols-outline.nvim lsp_signature.nvim")
      require("config.lsp")
    end,
  })

  -- Completion
  use({ "onsails/lspkind-nvim", opt = true })
  use({ "windwp/nvim-autopairs", opt = true })
  use({ "hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ", after = "nvim-compe" })
  use({
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      vim.cmd("PackerLoad lspkind-nvim nvim-autopairs")
      require("config.lsp.compe")
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
  use({ "mhartington/oceanic-next", event = "BufRead" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/playground",
      "p00f/nvim-ts-rainbow",
    },
    run = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  })
  use({ "vigoux/architext.nvim", event = "BufEnter" })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
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
    end,
  })
  use({ "rhysd/committia.vim" })
  use({ "ThePrimeagen/git-worktree.nvim" })

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
    cmd = { "Ultest", "UltestNearest", "UltestDebug", "UltestDebugNearest", "UltestOutput", "UltestSummary" },
  })
  use({
    "skywind3000/asyncrun.vim",
    requires = { "skywind3000/asynctasks.vim" },
    config = function()
      require("config.misc.async_config")
    end,
  })

  -- Language-related
  use({ "akinsho/flutter-tools.nvim" })
  use({ "simrat39/rust-tools.nvim" })
  use({ "ray-x/go.nvim" })
  use({ "folke/lua-dev.nvim" })
  use({ "ziglang/zig.vim", ft = "zig" })

  -- Misc
  use({
    "famiu/feline.nvim",
    config = function()
      vim.cmd("PackerLoad lsp-status.nvim")
      require("config.misc.feline")
    end,
  })
  use({
    "kristijanhusak/orgmode.nvim",
    ft = "org",
    config = function()
      require("config.misc.orgmode")
    end,
  })
  use({
    "antoinemadec/FixCursorHold.nvim",
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  })
  use({
    "folke/todo-comments.nvim",
    event = "BufRead",
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
  use({
    "rmagatti/auto-session",
    requires = "rmagatti/session-lens",
    config = function()
      vim.g.auto_session_enabled = false
      require("auto-session").setup({
        auto_session_enable_last_session = false,
        auto_session_eanbled = true,
        auto_save_enabled = true,
        auto_restore_enabled = false,
      })
    end,
  })
  use({ "eugen0329/vim-esearch", keys = "<leader>ff" })
  use({
    "kevinhwang91/nvim-bqf",
    config = function()
      require("config.misc.bqf")
    end,
  })
  use({
    "b3nj5m1n/kommentary",
    event = "BufRead",
  })
  use({ "gyim/vim-boxdraw", ft = { "markdown", "text" } })
  use({ "machakann/vim-sandwich", event = "BufRead" })
  use({
    "szw/vim-maximizer",
    event = "BufEnter",
    config = function()
      vim.g.maximizer_set_default_mapping = 0
      vim.g.maximizer_set_mapping_with_bang = 0
    end,
  })
  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("config.misc.colorizer")
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
