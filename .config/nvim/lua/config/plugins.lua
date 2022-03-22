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
    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("config.lsp")
      end,
    })
    use({
      "j-hui/fidget.nvim",
      config = function()
        require("fidget").setup({
          text = { spinner = "dots_negative" },
          window = { relative = "editor", blend = 0 },
        })
      end,
    })
    use({
      "ldelossa/litee.nvim",
      requires = { "ldelossa/litee-calltree.nvim", "ldelossa/litee-symboltree.nvim" },
      config = function()
        require("litee.lib").setup({
          notify = { enabled = true },
          panel = {
            orientation = "right",
            panel_size = 45,
          },
          tree = { icons = "nerd" },
        })
        require("litee.calltree").setup({
          on_open = "panel",
        })
        require("litee.symboltree").setup()
      end,
    })

    -- Completion
    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("config.completion")
      end,
      after = "nvim-treesitter",
    })
    use({
      "saadparwaiz1/cmp_luasnip",
      requires = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets", "honza/vim-snippets" },
      after = "nvim-cmp",
    })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({
      "petertriho/cmp-git",
      config = function()
        require("cmp_git").setup()
      end,
      after = "nvim-cmp",
    })
    use({ "kdheepak/cmp-latex-symbols", after = "nvim-cmp" })
    use({ "windwp/nvim-autopairs" })

    -- Fuzzy-finder
    use({
      "nvim-telescope/telescope.nvim",
      config = function()
        require("config.telescope")
      end,
      requires = { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    })
    use({ "nvim-telescope/telescope-ui-select.nvim" })
    use({
      "GustavoKatel/telescope-asynctasks.nvim",
      after = "telescope.nvim",
      config = function()
        require("config.misc.asynctasks").mapping()
      end,
    })
    use({
      "crispgm/telescope-heading.nvim",
      after = "telescope.nvim",
      ft = "markdown",
      config = function()
        require("telescope").load_extension("heading")
        vim.keymap.set("n", "<leader>lh", ":Telescope heading theme=ivy<CR>", { silent = true })
      end,
    })
    use({
      "folke/todo-comments.nvim",
      after = "telescope.nvim",
      config = function()
        require("todo-comments").setup({
          signs = false,
        })
        vim.keymap.set("n", "<leader>lT", ":TodoTelescope<CR>")
      end,
    })
    use({ "nvim-telescope/telescope-bibtex.nvim", ft = { "tex", "bib" }, after = "telescope.nvim" })

    -- User Interface
    use({ "MunifTanjim/nui.nvim" })

    -- Theme and Icons
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "kvrohit/substrata.nvim" })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.misc.treesitter")
      end,
    })
    use({
      "theHamsta/nvim-semantic-tokens",
      config = function()
        require("nvim-semantic-tokens").setup({
          preset = "default",
          highlight = { require("nvim-semantic-tokens.table-highlighter") },
        })
      end,
    })
    use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
    use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
    use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
    use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })
    use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
    use({
      "andymass/vim-matchup",
      setup = function()
        vim.g.matchup_motion_enabled = 0
        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_offscreen = {}
      end,
      after = "nvim-treesitter",
    })
    use({
      "danymat/neogen",
      config = function()
        require("neogen").setup({ snippet_engine = "luasnip" })
      end,
      after = "nvim-treesitter",
    })
    use({
      "SmiteshP/nvim-gps",
      config = function()
        require("nvim-gps").setup({ separator = " ❯ " })
      end,
      after = "nvim-treesitter",
    })

    -- Git
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.git.gitsigns")
      end,
    })
    use({ "tpope/vim-fugitive" })
    use({
      "rbong/vim-flog",
      setup = function()
        vim.g.flog_default_arguments = { max_count = 4000 }
      end,
    })
    use({
      "rhysd/git-messenger.vim",
      keys = "<leader>gm",
      setup = function()
        vim.g.git_messenger_include_diff = "current"
        vim.g.git_messenger_close_on_cursor_moved = false
        vim.g.git_messenger_always_into_popup = true
        vim.g.git_messenger_max_popup_height = 20
        vim.g.git_messenger_max_popup_width = 50
        vim.g.git_messenger_floating_win_opts = { border = "solid" }
      end,
    })
    use({ "rhysd/committia.vim" })
    use({ "ThePrimeagen/git-worktree.nvim" })

    -- Debugger
    use({
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("config.dap")
      end,
    })
    use({
      "nvim-telescope/telescope-dap.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension("dap")
      end,
    })
    use({ "mfussenegger/nvim-dap-python" })

    -- Testing and Runner
    use({
      "rcarriga/vim-ultest",
      requires = { "vim-test/vim-test" },
      setup = function()
        vim.g.ultest_icons = 0
        vim.g.ultest_virtual_text = 1
        vim.g.ultest_use_pty = 1
        vim.g.ultest_max_threads = 4
        vim.g.ultest_output_on_run = 0
        vim.g.ultest_output_on_line = 0
        vim.g.ultest_output_max_width = 65
        vim.g.ultest_output_max_height = 20
        vim.g.ultest_summary_width = 45
      end,
      run = ":UpdateRemotePlugins",
    })
    use({
      "skywind3000/asyncrun.vim",
      config = function()
        require("config.misc.asynctasks").setup()
      end,
      requires = { "skywind3000/asynctasks.vim" },
    })

    -- Language-related
    use({ "p00f/clangd_extensions.nvim" })
    use({ "akinsho/flutter-tools.nvim" })
    use({ "simrat39/rust-tools.nvim" })
    use({ "mfussenegger/nvim-jdtls" })
    use({ "scalameta/nvim-metals" })
    use({ "nanotee/sqls.nvim" })
    use({ "b0o/schemastore.nvim" })
    use({
      "Saecki/crates.nvim",
      event = "BufRead Cargo.toml",
      config = function()
        require("crates").setup()
      end,
    })
    use({ "ray-x/go.nvim" })
    use({ "folke/lua-dev.nvim" })
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("config.misc.null_ls")
      end,
    })

    -- Misc
    use({ "lewis6991/impatient.nvim" })
    use({
      "goolord/alpha-nvim",
      config = function()
        require("config.misc.alpha")
      end,
    })
    use({
      "feline-nvim/feline.nvim",
      config = function()
        require("config.misc.feline")
      end,
    })
    use({
      "anuvyklack/pretty-fold.nvim",
      config = function()
        require("config.misc.pretty-fold")
      end,
    })
    use({
      "akinsho/bufferline.nvim",
      config = function()
        require("config.misc.bufferline")
      end,
    })
    use({
      "akinsho/toggleterm.nvim",
      config = function()
        require("config.misc.toggleterm")
      end,
    })
    use({
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
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
      requires = { "tpope/vim-dadbod" },
      setup = function()
        vim.g.db_async = 1
        vim.g.db_ui_icons = {
          expanded = "ᐯ",
          collapsed = "›",
          saved_query = "•",
          new_query = "+",
          tables = "",
          buffers = "»",
          connection_ok = "✓",
          connection_error = "✕",
        }
        vim.g.db_ui_save_location = "~/Queries"
      end,
      cmd = { "DBUI" },
    })
    use({
      "kristijanhusak/vim-dadbod-completion",
      after = "vim-dadbod",
      ft = { "sql", "msql", "plsql" },
    })
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({
          sticky = false,
        })
      end,
    })
    use({
      "jbyuki/venn.nvim",
      config = function()
        vim.api.nvim_add_user_command("VennToggle", require("config.misc.venn").toggle_venn, {})
      end,
    })
    use({ "machakann/vim-sandwich" })
    use({
      "eugen0329/vim-esearch",
      setup = function()
        vim.g.esearch = {
          win_update_throttle_wait = 250,
          root_markers = {
            ".git",
            "Makefile",
            "node_modules",
            "Cargo.toml",
            "go.mod",
            "go.work",
            "__pycache__",
          },
        }
      end,
    })
    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "css", "dart", "lua" }, { names = false, RRGGBBAA = true })
      end,
    })
    use({
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("config.misc.nvim-tree")
      end,
    })
    use({
      "folke/persistence.nvim",
      config = function()
        require("persistence").setup()
      end,
    })
    use({
      "NTBBloodbath/rest.nvim",
      ft = "http",
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
          max_width = 65,
          max_height = 3,
          minimum_width = 35,
          render = "minimal",
          stages = "fade",
        })
      end,
    })
    use({ "tpope/vim-dotenv" })
    use({ "antoinemadec/FixCursorHold.nvim" })

    -- Lua development
    use({ "rafcamlet/nvim-luapad", cmd = "Luapad" })
  end,
})
