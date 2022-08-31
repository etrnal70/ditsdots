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
          align = { bottom = false },
          fmt = { max_width = 65 },
          sources = { ["null-ls"] = { ignore = true } },
          text = { spinner = "dots" },
          window = { relative = "editor", blend = 0 },
        })
      end,
    })
    use({
      "kosayoda/nvim-lightbulb",
      config = function()
        require("nvim-lightbulb").setup({
          sign = { enabled = false },
          virtual_text = { enabled = true },
        })
      end,
    })
    use({
      "simrat39/inlay-hints.nvim",
      config = function()
        require("inlay-hints").setup({
          hints = {
            parameter = { show = false },
          },
        })
      end,
    })
    use({
      "zbirenbaum/neodim",
      disable = true,
      event = "LspAttach",
      config = function()
        require("neodim").setup({
          update_in_insert = {
            delay = 1000,
          },
        })
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
      requires = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
      after = "nvim-cmp",
    })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
    use({
      "petertriho/cmp-git",
      config = function()
        require("cmp_git").setup()
      end,
      after = "nvim-cmp",
    })
    use({ "davidsierradz/cmp-conventionalcommits", after = "nvim-cmp" })
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
    use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
    use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
    use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
    use({ "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" })
    use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })
    use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
    use({
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup()
      end,
      after = "nvim-treesitter",
    })
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
      "SmiteshP/nvim-navic",
      config = function()
        require("nvim-navic").setup({ highlight = true, separator = " ❯ " })
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
      "f-person/git-blame.nvim",
      setup = function()
        vim.g.gitblame_enabled = 0
        vim.g.gitblame_display_virtual_text = 0
        vim.g.gitblame_message_template = "<author> • <summary>"
      end,
    })
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
    -- use({ "rhysd/conflict-marker.vim" })
    use({
      "akinsho/git-conflict.nvim",
      config = function()
        require("git-conflict").setup({
          default_mappings = false,
          disable_diagnostics = true,
        })
      end,
    })
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
      "nvim-neotest/neotest",
      requires = {
        "vim-test/vim-test",
        "nvim-neotest/neotest-vim-test",
        "nvim-neotest/neotest-go",
        "rouge8/neotest-rust",
      },
      config = function()
        require("config.misc.neotest")
      end,
    })
    use({
      "stevearc/overseer.nvim",
      config = function()
        require("overseer").setup()
      end,
    })

    -- Language-related
    use({ "p00f/clangd_extensions.nvim" })
    use({ "akinsho/flutter-tools.nvim" })
    use({ "simrat39/rust-tools.nvim" })
    use({ "b0o/schemastore.nvim" })
    use({
      "ray-x/go.nvim",
      ft = { "go", "gomod", "gowork", "gohtmltmpl" },
      config = function()
        require("go").setup({
          tag_transform = "snakecase",
          dap_debug_keymap = false,
          dap_debug_vt = false,
        })
      end,
    })
    use({ "jose-elias-alvarez/typescript.nvim" })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("config.misc.null_ls")
      end,
    })

    -- Misc
    use({
      "stevearc/dressing.nvim",
      config = function()
        require("dressing").setup({
          input = {
            winhighlight = "Normal",
          },
          select = {
            backend = { "telescope", "builtin", "nui" },
          },
        })
      end,
    })
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
        require("config.misc.feline").setup()
      end,
    })
    use({
      "kevinhwang91/nvim-ufo",
      requires = "kevinhwang91/promise-async",
      config = function()
        require("config.misc.nvim-ufo")
      end,
    })
    use({
      "rafcamlet/tabline-framework.nvim",
      config = function()
        require("config.misc.tabline")
      end,
    })
    use({
      "akinsho/toggleterm.nvim",
      config = function()
        require("config.misc.toggleterm")
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
      "frabjous/knap",
      setup = function()
        vim.g.knap_settings = { delay = 500 }
      end,
    })
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({})
      end,
    })
    use({
      "jbyuki/venn.nvim",
      config = function()
        vim.api.nvim_create_user_command("VennToggle", require("config.misc.venn").toggle_venn, {})
      end,
    })
    -- use({ "machakann/vim-sandwich" })
    use({
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
        require("nvim-surround").setup({ highlights = { duration = 0 } })
      end,
    })
    use({
      "simrat39/symbols-outline.nvim",
      config = function()
        require("symbols-outline").setup({
          relative_width = false,
        })
      end,
    })
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
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "css", "dart", "lua" }, { names = false, RRGGBBAA = true, mode = "virtualtext" })
      end,
    })
    use({ "RRethy/vim-illuminate" })
    use({
      "nvim-neo-tree/neo-tree.nvim",
      requires = { "s1n7ax/nvim-window-picker" },
      config = function()
        require("config.misc.neo-tree")
      end,
    })
    use({
      "folke/persistence.nvim",
      config = function()
        require("persistence").setup()
      end,
    })
    use({
      "andrewferrier/textobj-diagnostic.nvim",
      config = function()
        require("textobj-diagnostic").setup()
      end,
    })
    use({
      "Darazaki/indent-o-matic",
      config = function()
        require("indent-o-matic").setup({
          max_lines = 5000,
        })
      end,
    })
    use({
      "rest-nvim/rest.nvim",
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
          background_colour = "NormalFloat",
          minimum_width = 45,
          stages = "static",
          render = "minimal",
          -- render = function(bufnr, notif, hl)
          --   local namespace = require("notify.render.base").namespace()
          --   notif.message = notif.icon .. " | " .. notif.message
          --   vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)
          --   vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
          --     hl_group = hl.icon,
          --     end_line = #notif.message - 1,
          --     end_col = #notif.message[#notif.message],
          --     priority = 50,
          --   })
          -- end,
          on_open = function(win)
            local buf = vim.api.nvim_win_get_buf(win)
            local line = vim.api.nvim_buf_get_lines(buf, 0, -1, false)[1]
            local max_width = 45
            local height = math.floor(#line / max_width) + 1
            vim.keymap.set("n", "j", "gj", { buffer = buf })
            vim.keymap.set("n", "k", "gk", { buffer = buf })
            vim.wo[win].wrap = true
            vim.api.nvim_win_set_config(win, {
              anchor = "SE",
              border = "solid",
              relative = "editor",
              width = max_width,
              height = height,
              row = vim.o.lines - vim.o.cmdheight - 2,
              col = vim.o.columns - vim.wo.numberwidth - 2,
            })
          end,
        })
      end,
    })
    use({ "tpope/vim-dotenv" })
    use({ "antoinemadec/FixCursorHold.nvim" })

    -- Lua development
    use({ "rafcamlet/nvim-luapad", cmd = "Luapad" })
  end,
})
