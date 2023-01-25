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

require("lazy").setup({
  -- stdlib
  { "nvim-lua/plenary.nvim", lazy = false },

  -- LSP Plugins
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lsp"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {
        floating_window = false,
        always_trigger = true,
        hint_prefix = "ﰠ ",
      }
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup {
        sign = { enabled = false },
        virtual_text = { enabled = true },
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
  {
    "lvimuser/document-color.nvim",
    config = function()
      require("document-color").setup {
        mode = "single",
      }
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    enabled = false,
    branch = "anticonceal",
    config = function()
      require("lsp-inlayhints").setup {
        inlay_hints = {
          virt_text_formatter = function(label, hint, opts, _)
            local virt_text = {}
            virt_text[#virt_text + 1] = hint.paddingLeft and { " ", "Normal" } or nil
            virt_text[#virt_text + 1] = { " " .. label .. " ", opts.highlight }
            virt_text[#virt_text + 1] = hint.paddingRight and { " ", "Normal" } or nil

            return virt_text
          end,
        },
      }
    end,
  },
  "yioneko/nvim-type-fmt",

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require "config.completion"
    end,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", dependencies = { "nvim-lspconfig" } },
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-buffer",
      "davidsierradz/cmp-conventionalcommits",
      "kdheepak/cmp-latex-symbols",
      "lukas-reineke/cmp-under-comparator",
    },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
  },
  {
    "petertriho/cmp-git",
    config = function()
      require("cmp_git").setup()
    end,
  },
  "windwp/nvim-autopairs",

  -- Fuzzy-finder
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "config.telescope"
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
  },
  "nvim-telescope/telescope-ui-select.nvim",
  {
    "crispgm/telescope-heading.nvim",
    ft = "markdown",
    config = function()
      require("telescope").load_extension "heading"
      vim.keymap.set("n", "<leader>lh", ":Telescope heading theme=ivy<CR>", { silent = true })
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {
        signs = false,
      }
      vim.keymap.set("n", "<leader>lT", ":TodoTelescope<CR>")
    end,
  },
  { "nvim-telescope/telescope-bibtex.nvim", ft = { "tex", "bib" } },

  -- User Interface
  "MunifTanjim/nui.nvim",
  {
    "folke/noice.nvim",
    config = function()
      require "config.misc.noice"
    end,
  },
  -- {
  --   "lewis6991/satellite.nvim",
  --   config = function()
  --     require("satellite").setup {
  --       winblend = 100,
  --       handlers = {
  --         gitsigns = { enable = false },
  --         search = { enable = false },
  --         marks = { enable = false },
  --       },
  --     }
  --   end,
  -- },

  -- Theme and Icons
  "kyazdani42/nvim-web-devicons",
  {
    "https://github.com/sam4llis/nvim-tundra",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-tundra").setup {
        transparent_background = true,
        dim_inactive_windows = {
          enabled = false,
        },
        plugins = {
          lsp = true,
          treesitter = true,
          cmp = true,
          context = true,
          dbui = true,
          telescope = true,
        },
      }
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- cmd = "TSUpdate",
    config = function()
      vim.schedule(function()
        require "config.misc.treesitter"
      end)
    end,
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/nvim-treesitter-refactor",
  "RRethy/nvim-treesitter-textsubjects",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "mrjones2014/nvim-ts-rainbow",
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup()
    end,
  },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_motion_enabled = 0
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    init = function()
      require("ssr").setup {}
    end,
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup { snippet_engine = "luasnip" }
    end,
  },
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
    config = function()
      require("barbecue").setup {
        create_autocmd = false,
        symbols = { separator = "❯" },
      }
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "config.git.gitsigns"
    end,
  },
  "tpope/vim-fugitive",
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("neogit").setup()
    end,
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
  -- { "rhysd/conflict-marker.vim" })
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup {
        default_mappings = false,
        disable_diagnostics = true,
      }
    end,
  },
  "ThePrimeagen/git-worktree.nvim",

  -- Debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require "config.dap"
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension "dap"
    end,
  },
  { "mfussenegger/nvim-dap-python", dependencies = "mfussenegger/nvim-dap" },
  { "mxsdev/nvim-dap-vscode-js", dependencies = "mfussenegger/nvim-dap" },

  -- Testing and Runner
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
      "sidlatau/neotest-dart",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      require "config.misc.neotest"
    end,
  },
  {
    "stevearc/overseer.nvim",
    config = function()
      require "config.misc.overseer"
    end,
  },

  -- Language-related
  "p00f/clangd_extensions.nvim",
  "akinsho/flutter-tools.nvim",
  "simrat39/rust-tools.nvim",
  "b0o/schemastore.nvim",
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod", "gowork", "gohtmltmpl" },
    config = function()
      require("go").setup {
        lsp_inlay_hints = { enable = false },
        tag_transform = "snakecase",
        dap_debug_keymap = false,
        dap_debug_vt = false,
      }
    end,
  },
  "jose-elias-alvarez/typescript.nvim",
  "yioneko/nvim-vtsls",
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "config.misc.null_ls"
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    ft = { "markdown", "neorg", "org" },
    config = function()
      require("headlines").setup {
        markdown = {
          headline_highlights = { "Headline1", "Headline2" },
        },
      }
    end,
  },

  -- Misc
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {
        input = {
          border = require("config.utils").transparent_border,
          win_options = { winhighlight = "NormalFloat:Normal" },
        },
        select = {
          backend = { "telescope", "builtin", "nui" },
        },
      }
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require "config.misc.alpha"
    end,
  },
  {
    "feline-nvim/feline.nvim",
    lazy = false,
    config = function()
      require("config.misc.feline").setup()
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require "config.misc.statuscol"
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require "config.misc.nvim-ufo"
    end,
  },
  {
    "rafcamlet/tabline-framework.nvim",
    config = function()
      require "config.misc.tabline"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "config.misc.toggleterm"
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = function()
      require("octo").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {}
    end,
  },
  {
    "jbyuki/venn.nvim",
    config = function()
      vim.api.nvim_create_user_command("VennToggle", require("config.misc.venn").toggle_venn, {})
    end,
  },
  -- { "machakann/vim-sandwich" })
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup { highlights = { duration = 0 } }
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup {
        border = require("config.utils").transparent_border,
        preview_bg_highlight = "NormalNC",
        relative_width = false,
        show_symbol_details = false,
        width = 35,
        wrap = true,
      }
    end,
  },
  {
    "eugen0329/vim-esearch",
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
    config = function()
      require("tint").setup {
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
      }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        filetypes = { "css", "dart", "lua" },
        user_default_options = {
          names = false,
          mode = "virtualtext",
        },
      }
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "LspAttach",
    config = function()
      require("illuminate").configure {
        filetypes_denylist = {
          "floggraph",
          "fugitive",
          "Outline",
          "neo-tree",
        },
        large_file_cutoff = 50000,
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "s1n7ax/nvim-window-picker" },
    config = function()
      require "config.misc.neo-tree"
    end,
  },
  {
    "folke/persistence.nvim",
    config = function()
      require("persistence").setup()
    end,
  },
  {
    "andrewferrier/textobj-diagnostic.nvim",
    config = function()
      require("textobj-diagnostic").setup()
    end,
  },
  {
    "glepnir/hlsearch.nvim",
    event = "BufRead",
    config = function()
      require("hlsearch").setup()
    end,
  },
  {
    "Darazaki/indent-o-matic",
    config = function()
      require("indent-o-matic").setup {
        max_lines = 5000,
      }
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = function()
      require("rest-nvim").setup()
    end,
  },
  {
    "vigoux/notifier.nvim",
    config = function()
      require("notifier").setup()
    end,
  },
  { "xiyaowong/virtcolumn.nvim" },

  -- Lua development
  { "rafcamlet/nvim-luapad", cmd = "Luapad" },
  {
    "AckslD/messages.nvim",
    config = function()
      require("messages").setup()
      _G.Map = function(...)
        require("messages.api").capture_thing(...)
      end
    end,
  },
}, {
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
})
