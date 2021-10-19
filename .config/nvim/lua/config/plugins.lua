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

return packer.startup({
  function(use)
    -- Plugin Manager
    use({ "wbthomason/packer.nvim" })

    -- stdlib
    use({ "nvim-lua/plenary.nvim" })

    -- LSP Plugins
    use({ "nvim-lua/lsp_extensions.nvim" })
    use({ "nvim-lua/lsp-status.nvim" })
    use({
      "simrat39/symbols-outline.nvim",
      config = function()
        vim.g.symbols_outline = {
          highlight_hovered_item = true,
          auto_preview = false,
          position = "right",
          width = 15,
          keymaps = {
            hover_symbol = "K",
            toggle_preview = "<C-space>",
          },
        }
      end,
    })
    use({ "ray-x/lsp_signature.nvim" })
    use({ "weilbith/nvim-code-action-menu" })
    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("config.lsp")
      end,
    })

    -- Completion
    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("config.completion.cmp")
      end,
    })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({
      "saadparwaiz1/cmp_luasnip",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
      requires = { "L3MON4D3/LuaSnip" },
      after = "nvim-cmp",
    })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "kdheepak/cmp-latex-symbols", after = "nvim-cmp" })
    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
        require("config.completion.autopairs")
      end,
    })
    use({ "rafamadriz/friendly-snippets" })

    -- Fuzzy-finder
    use({
      "nvim-telescope/telescope.nvim",
      config = function()
        require("config.telescope")
      end,
      requires = {
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
    })
    use({ "GustavoKatel/telescope-asynctasks.nvim", requires = "telescope.nvim" })
    -- use({ "nvim-telescope/telescope-bibtex.nvim" })
    use({
      "xiyaowong/telescope-emoji.nvim",
      requires = "telescope.nvim",
      config = function()
        require("telescope").load_extension("emoji")
      end,
    })
    use({
      "crispgm/telescope-heading.nvim",
      requires = "telescope.nvim",
      ft = "markdown",
      config = function()
        require("telescope").load_extension("heading")
      end,
    })

    -- Theme and Icons
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "kvrohit/substrata.nvim" })

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
        require("nvim-gps").setup({
          separator = " ᐳ ",
        })
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
    -- use({ "TimUntersberger/neogit", disable = true, requires = "sindrets/diffview.nvim" })
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
      "rcarriga/nvim-dap-ui",
      requires = {
        "mfussenegger/nvim-dap",
      },
    })
    use({
      "nvim-telescope/telescope-dap.nvim",
      config = function()
        require("telescope").load_extension("dap")
      end,
    })
    use({ "mfussenegger/nvim-dap-python" })

    -- Testing and Runner
    use({
      "rcarriga/vim-ultest",
      run = ":UpdateRemotePlugins",
      cmd = { "Ultest", "UltestNearest", "UltestDebug", "UltestDebugNearest" },
    })
    use({ "vim-test/vim-test", opt = true })
    use({
      "skywind3000/asyncrun.vim",
      requires = { "skywind3000/asynctasks.vim" },
      config = function()
        require("config.misc.asynctasks")
      end,
    })

    -- Language-related
    use({ "akinsho/flutter-tools.nvim" })
    use({ "simrat39/rust-tools.nvim" })
    use({ "Saecki/crates.nvim", opt = true })
    use({ "ray-x/go.nvim" })
    use({ "folke/lua-dev.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
    -- use({ "dccsillag/magma-nvim" })

    -- Misc
    use({ "lewis6991/impatient.nvim" }) -- Remove after neovim/pull/15436 merged
    use({
      "goolord/alpha-nvim",
      config = function()
        require("config.misc.alpha")
      end,
    })
    use({
      "famiu/feline.nvim",
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
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
      end,
    })
    use({
      "https://gitlab.com/yorickpeterse/nvim-pqf.git",
      config = function()
        require("pqf").setup()
      end,
    })
    use({
      "pwntester/octo.nvim",
      cmd = "Octo",
      config = function()
        require("octo").setup()
      end,
    })
    use({
      "kristijanhusak/vim-dadbod-ui",
      requires = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion" },
      config = function()
        vim.api.nvim_command(
          "autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })"
        )
      end,
      ft = "sql",
    })
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({
          sticky = false,
        })
      end,
    })
    use({ "gyim/vim-boxdraw", opt = true })
    use({ "machakann/vim-sandwich", event = "InsertEnter" })
    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "*" }, { names = false, RRGGBBAA = true })
      end,
    })
    use({
      "RRethy/vim-illuminate",
      config = function()
        vim.g.Illuminate_delay = 750
        vim.g.Illuminate_ftblacklist = {
          "NvimTree",
          "Telescope",
        }
      end,
    })
    use({
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
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
    use({
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require("notify")
        require("notify").setup({
          background_colour = "#000000",
          stages = "fade",
        })
      end,
    })
    use({ "tpope/vim-scriptease", opt = true })
    use({ "soywod/himalaya", rtp = "vim" })
  end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  },
})
