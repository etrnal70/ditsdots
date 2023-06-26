local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
    -- stdlib
    { "nvim-lua/plenary.nvim", lazy = true },
    { "MunifTanjim/nui.nvim", lazy = true },

    -- LSP Plugins
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "config.lsp"
      end,
      dependencies = {
        {
          "ray-x/lsp_signature.nvim",
          opts = {
            floating_window = false,
            always_trigger = true,
            hint_prefix = " ",
            hint_inline = function()
              return false
            end,
          },
        },
        {
          "linrongbin16/lsp-progress.nvim",
          config = function()
            require("lsp-progress").setup {
              format = function(client_messages)
                return #client_messages > 0 and (table.concat(client_messages, " ")) or ""
              end,
            }
          end,
        },
        {
          "DNLHC/glance.nvim",
          config = function()
            local actions = require("glance").actions
            require("glance").setup {
              mappings = {
                list = {
                  ["<C-x>"] = actions.jump_split,
                  ["<C-v>"] = actions.jump_vsplit,
                  ["<C-t>"] = actions.jump_tab,
                },
              },
              folds = {
                fold_closed = "",
                fold_open = "",
              },
              hooks = {
                before_open = function(results, open, jump, _)
                  if #results == 1 then
                    jump(results[1])
                  else
                    open(results)
                  end
                end,
              },
            }
          end,
        },
        -- {
        --   "VidocqH/lsp-lens.nvim",
        --   config = true,
        -- },
        {
          "lvimuser/document-color.nvim",
          config = true,
        },
        "yioneko/nvim-type-fmt",
        "p00f/clangd_extensions.nvim",
        "akinsho/flutter-tools.nvim",
        "simrat39/rust-tools.nvim",
        "mfussenegger/nvim-jdtls",
        "b0o/schemastore.nvim",
        "jose-elias-alvarez/typescript.nvim",
        "yioneko/nvim-vtsls",
      },
    },

    -- Completion
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        require "config.completion"
      end,
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
          "saadparwaiz1/cmp_luasnip",
          dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
        },
        {
          "petertriho/cmp-git",
          config = true,
        },
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-buffer",
        "davidsierradz/cmp-conventionalcommits",
        "kdheepak/cmp-latex-symbols",
        "lukas-reineke/cmp-under-comparator",
        "windwp/nvim-autopairs",
        "rcarriga/cmp-dap",
      },
    },

    -- Theme and Icons
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
      "sam4llis/nvim-tundra",
      lazy = false,
      priority = 1000,
      opts = {
        transparent_background = true,
        dim_inactive_windows = {
          enabled = true,
        },
        plugins = {
          lsp = true,
          treesitter = true,
          cmp = true,
          context = true,
          dbui = true,
          telescope = true,
        },
      },
    },

    -- Treesitter
    {
      "utilyre/barbecue.nvim",
      version = "*",
      event = "BufWinEnter",
      dependencies = { "SmiteshP/nvim-navic" },
      init = function()
        vim.api.nvim_create_autocmd({
          "WinScrolled",
          "BufWinEnter",
          "CursorHold",
          "InsertLeave",
          "BufWritePost",
          "TextChanged",
          "TextChangedI",
        }, {
          group = vim.api.nvim_create_augroup("barbecue#create_autocmd", {}),
          callback = function()
            require("barbecue.ui").update()
          end,
        })
      end,
      opts = {
        create_autocmd = false,
        symbols = { separator = "❯" },
        show_dirname = false,
        context_follow_icon_color = false,
      },
    },

    -- Git
    {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPost",
      config = function()
        require "config.git.gitsigns"
      end,
    },
    { "tpope/vim-fugitive", lazy = true },
    {
      -- "TimUntersberger/neogit",
      "CKolkey/neogit",
      cmd = "Neogit",
      keys = {
        { "<leader>gg", "<cmd>Neogit kind=split<CR>" },
        { "<leader>gl", "<cmd>Neogit log<CR>" },
      },
      opts = {
        disable_builtin_notifications = true,
        kind = "split",
        integrations = { diffview = true },
      },
      dependencies = {
        {
          "sindrets/diffview.nvim",
          opts = { enhanced_diff_hl = true },
        },
      },
    },
    { "rbong/vim-flog", cmd = { "Flog", "Flogsplit" } },
    {
      "rhysd/git-messenger.vim",
      keys = "<leader>gm",
      init = function()
        vim.g.git_messenger_include_diff = "current"
        vim.g.git_messenger_close_on_cursor_moved = false
        vim.g.git_messenger_always_into_popup = true
        vim.g.git_messenger_max_popup_height = 20
        vim.g.git_messenger_max_popup_width = 50
        vim.g.git_messenger_floating_win_opts = { border = "solid" }
      end,
    },
    "rhysd/committia.vim",
    {
      "akinsho/git-conflict.nvim",
      event = "BufReadPre",
      opts = {
        default_mappings = true,
        disable_diagnostics = true,
      },
    },
    -- "ThePrimeagen/git-worktree.nvim",

    -- Testing and Runner
    {
      "nvim-neotest/neotest",
      lazy = true,
      dependencies = {
        "nvim-neotest/neotest-go",
        "rouge8/neotest-rust",
        "sidlatau/neotest-dart",
        "haydenmeade/neotest-jest",
        "marilari88/neotest-vitest",
      },
      init = function()
        vim.api.nvim_create_user_command("Neotest", "Lazy load neotest", {})
      end,
      config = function()
        require("config.misc.neotest").setup()
      end,
    },
    {
      "stevearc/overseer.nvim",
      keys = {
        { "<leader>ot", "<cmd>OverseerToggle!<CR>" },
        { "<leader>or", "<cmd>OverseerRun<CR>" },
        { "<leader>oR", "<cmd>OverseerRunLast<CR>" },
        { "<leader>ol", "<cmd>OverseerOpenLogLast<CR>" },
      },
      config = function()
        require("config.overseer").setup()
      end,
    },

    -- Language-related
    {
      "crispgm/nvim-go",
      ft = { "go", "gomod", "gowork", "gohtmltmpl" },
      build = ":GoInstallBinaries",
      opts = {
        auto_lint = false,
        auto_format = false,
        maintain_cursor_pos = true,
        lint_prompt_style = "vt",
      },
    },
    {
      "lukas-reineke/headlines.nvim",
      ft = { "markdown", "neorg", "org" },
      opts = {
        markdown = {
          headline_highlights = false,
        },
      },
    },

    -- Misc
    {
      "stevearc/dressing.nvim",
      lazy = true,
      init = function()
        vim.ui.select = function(...)
          require("lazy").load { plugins = { "dressing.nvim" } }
          return vim.ui.select(...)
        end
        vim.ui.input = function(...)
          require("lazy").load { plugins = { "dressing.nvim" } }
          return vim.ui.input(...)
        end
      end,
      opts = {
        input = {
          border = "solid",
          win_options = { winhighlight = "NormalFloat:Normal" },
        },
        select = {
          backend = { "builtin" },
          builtin = {
            relative = "editor",
            border = "solid",
            max_width = { 45, 0.35 },
            min_width = { 30, 0.15 },
            max_height = 0.3,
            min_height = { 4, 0.1 },
            win_options = {
              winblend = 0,
            },
          },
          get_config = function(opts)
            if opts.kind == "codeaction" then
              return {
                builtin = {
                  relative = "cursor",
                },
              }
            end
          end,
        },
      },
    },
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require "statuscol.builtin"
        require("statuscol").setup {
          setopt = true,
          relculright = true,
          ft_ignore = { "Neogit", "neo-tree", "Outline", "dapui_*" },
          bt_ignore = { "terminal", "nofile" },
          segments = {
            {
              sign = { namespace = { "gitsigns_extmark_signs_" }, maxwidth = 1, colwidth = 1, auto = false },
              click = "v:lua.ScSa",
            },
            {
              text = { builtin.lnumfunc, " " },
              condition = { true, builtin.not_empty },
              click = "v:lua.ScLa",
            },
            {
              sign = { name = { "Dap" }, maxwidth = 1, colwidth = 2, auto = true },
              click = "v:lua.ScSa",
            },
          },
        }
      end,
    },
    {
      "pwntester/octo.nvim",
      cmd = "Octo",
      config = true,
    },
    {
      "numToStr/Comment.nvim",
      config = true,
    },
    {
      "jbyuki/venn.nvim",
      init = function()
        vim.api.nvim_create_user_command("VennToggle", require("config.misc.venn").toggle_venn, {})
      end,
    },
    -- { "machakann/vim-sandwich" })
    {
      "kylechui/nvim-surround",
      opts = { highlights = { duration = 0 } },
    },
    {
      "stevearc/aerial.nvim",
      config = true,
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      config = function()
        require("symbols-outline").setup {
          border = require("config.utils").transparent_border,
          preview_bg_highlight = "NormalNC",
          relative_width = false,
          show_symbol_details = false,
          width = 35,
        }
      end,
    },
    {
      "eugen0329/vim-esearch",
      keys = "<leader>ff",
      init = function()
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
    },
    {
      "levouh/tint.nvim",
      event = "BufWinEnter",
      opts = {
        tint = -20,
        highlight_ignore_patterns = { "WinSeparator", "Status.*" },
        window_ignore_function = function(winid)
          local buf = vim.api.nvim_win_get_buf(winid)
          local ft = vim.api.nvim_buf_get_option(buf, "filetype")

          if ft == "neo-tree" then
            return true
          end

          return false
        end,
      },
    },
    {
      "NvChad/nvim-colorizer.lua",
      ft = { "css", "dart", "lua" },
      opts = {
        filetypes = { "css", "dart", "lua" },
        user_default_options = {
          names = false,
          mode = "virtualtext",
        },
      },
    },
    {
      "tzachar/local-highlight.nvim",
      event = "BufReadPre",
      opts = {
        file_types = { "*" },
      },
    },
    {
      "andrewferrier/textobj-diagnostic.nvim",
      event = "BufWinEnter",
      config = true,
    },
    {
      "glepnir/hlsearch.nvim",
      event = "BufWinEnter",
      config = true,
    },
    {
      "Darazaki/indent-o-matic",
      event = "BufWinEnter",
      opts = {
        max_lines = 5000,
      },
    },
    {
      "rest-nvim/rest.nvim",
      ft = "http",
      keys = {
        { "<leader>rr", "<Plug>RestNvim" },
        { "<leader>rp", "<Plug>RestNvimPreview" },
      },
      config = true,
    },
    { "xiyaowong/virtcolumn.nvim", event = "VeryLazy" },
    {
      "willothy/flatten.nvim",
      opts = {
        window = { open = "alternate" },
      },
      lazy = false,
      priority = 1001,
    },
    {
      "chrisgrieser/nvim-early-retirement",
      config = true,
      event = "VeryLazy",
    },

    -- Lua development
    { "rafcamlet/nvim-luapad", cmd = "Luapad" },
    { "paretje/nvim-man", cmd = { "Man", "VMan" } },
  },
  {
    change_detection = {
      enabled = false,
      notify = false,
    },
    install = { colorscheme = { "tundra" } },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  },
}
