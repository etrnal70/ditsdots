local function ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd.packadd "packer.nvim"
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup {
  function(use)
    -- Plugin Manager
    use "wbthomason/packer.nvim"

    -- stdlib
    use "nvim-lua/plenary.nvim"

    -- LSP Plugins
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require "config.lsp"
      end,
    }
    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup {
          floating_window = false,
          always_trigger = true,
          hint_prefix = "ﰠ ",
        }
      end,
    }
    use {
      "kosayoda/nvim-lightbulb",
      config = function()
        require("nvim-lightbulb").setup {
          sign = { enabled = false },
          virtual_text = { enabled = true },
        }
      end,
    }
    use {
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
    }
    use {
      "theHamsta/nvim-semantic-tokens",
      config = function()
        require("nvim-semantic-tokens").setup {
          preset = "default",
          highlighters = { require "nvim-semantic-tokens.table-highlighter" },
        }
      end,
    }
    use {
      "lvimuser/document-color.nvim",
      config = function()
        require("document-color").setup {
          mode = "single",
        }
      end,
    }
    use {
      "lvimuser/lsp-inlayhints.nvim",
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
    }

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      config = function()
        require "config.completion"
      end,
      after = "nvim-treesitter",
    }
    use {
      "saadparwaiz1/cmp_luasnip",
      requires = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
      after = "nvim-cmp",
    }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
    use {
      "petertriho/cmp-git",
      config = function()
        require("cmp_git").setup()
      end,
      after = "nvim-cmp",
    }
    use { "davidsierradz/cmp-conventionalcommits", after = "nvim-cmp" }
    use { "kdheepak/cmp-latex-symbols", after = "nvim-cmp" }
    use { "lukas-reineke/cmp-under-comparator", after = "nvim-cmp" }
    use "windwp/nvim-autopairs"

    -- Fuzzy-finder
    use {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "config.telescope"
      end,
      requires = {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    }
    use "nvim-telescope/telescope-ui-select.nvim"
    use {
      "crispgm/telescope-heading.nvim",
      after = "telescope.nvim",
      ft = "markdown",
      config = function()
        require("telescope").load_extension "heading"
        vim.keymap.set("n", "<leader>lh", ":Telescope heading theme=ivy<CR>", { silent = true })
      end,
    }
    use {
      "folke/todo-comments.nvim",
      after = "telescope.nvim",
      config = function()
        require("todo-comments").setup {
          signs = false,
        }
        vim.keymap.set("n", "<leader>lT", ":TodoTelescope<CR>")
      end,
    }
    use { "nvim-telescope/telescope-bibtex.nvim", ft = { "tex", "bib" }, after = "telescope.nvim" }

    -- User Interface
    use "MunifTanjim/nui.nvim"
    use {
      "folke/noice.nvim",
      config = function()
        require "config.misc.noice"
      end,
    }
    use {
      "lewis6991/satellite.nvim",
      disable = true,
      config = function()
        require("satellite").setup {
          winblend = 100,
          handlers = {
            gitsigns = { enable = false },
            search = { enable = false },
            marks = { enable = false },
          },
        }
      end,
    }

    -- Theme and Icons
    use "kyazdani42/nvim-web-devicons"
    use "kvrohit/substrata.nvim"
    use {
      "https://github.com/sam4llis/nvim-tundra",
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
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "config.misc.treesitter"
      end,
    }
    use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
    use { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" }
    use { "nvim-treesitter/playground", after = "nvim-treesitter" }
    use { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
    use { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }
    use {
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup()
      end,
      after = "nvim-treesitter",
    }
    use {
      "andymass/vim-matchup",
      setup = function()
        vim.g.matchup_motion_enabled = 0
        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_offscreen = {}
      end,
      after = "nvim-treesitter",
    }
    use {
      "cshuaimin/ssr.nvim",
      module = "ssr",
      setup = function()
        require("ssr").setup {}
      end,
    }
    use {
      "danymat/neogen",
      config = function()
        require("neogen").setup { snippet_engine = "luasnip" }
      end,
      after = "nvim-treesitter",
    }
    use {
      "SmiteshP/nvim-navic",
      config = function()
        require("nvim-navic").setup { highlight = true, separator = " ❯ " }
      end,
      after = "nvim-treesitter",
    }

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require "config.git.gitsigns"
      end,
    }
    use "tpope/vim-fugitive"
    use {
      "rbong/vim-flog",
      branch = "v2",
    }
    use {
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
    }
    use "rhysd/committia.vim"
    -- { "rhysd/conflict-marker.vim" })
    use {
      "akinsho/git-conflict.nvim",
      config = function()
        require("git-conflict").setup {
          default_mappings = false,
          disable_diagnostics = true,
        }
      end,
    }
    use "ThePrimeagen/git-worktree.nvim"

    -- Debugger
    use {
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require "config.dap"
      end,
    }
    use {
      "nvim-telescope/telescope-dap.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension "dap"
      end,
    }
    use "mfussenegger/nvim-dap-python"

    -- Testing and Runner
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-neotest/neotest-go",
        "rouge8/neotest-rust",
        "sidlatau/neotest-dart",
        "haydenmeade/neotest-jest",
        "marilari88/neotest-vitest",
      },
      config = function()
        require "config.misc.neotest"
      end,
    }
    use {
      "stevearc/overseer.nvim",
      config = function()
        require "config.misc.overseer"
      end,
    }

    -- Language-related
    use "p00f/clangd_extensions.nvim"
    use "akinsho/flutter-tools.nvim"
    use "simrat39/rust-tools.nvim"
    use "b0o/schemastore.nvim"
    use {
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
    }
    use "jose-elias-alvarez/typescript.nvim"
    use {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "config.misc.null_ls"
      end,
    }
    use {
      "lukas-reineke/headlines.nvim",
      config = function()
        require("headlines").setup {
          markdown = {
            headline_highlights = { "Headline1", "Headline2" },
          },
        }
      end,
    }

    -- Misc
    use {
      "stevearc/dressing.nvim",
      config = function()
        require("dressing").setup {
          input = {
            border = require("config.utils").transparent_border,
            winhighlight = "NormalFloat:Normal",
          },
          select = {
            backend = { "telescope", "builtin", "nui" },
          },
        }
      end,
    }
    use "lewis6991/impatient.nvim"
    use {
      "goolord/alpha-nvim",
      config = function()
        require "config.misc.alpha"
      end,
    }
    use {
      "feline-nvim/feline.nvim",
      config = function()
        require("config.misc.feline").setup()
      end,
    }
    use {
      "kevinhwang91/nvim-ufo",
      requires = "kevinhwang91/promise-async",
      config = function()
        require "config.misc.nvim-ufo"
      end,
    }
    use {
      "rafcamlet/tabline-framework.nvim",
      config = function()
        require "config.misc.tabline"
      end,
    }
    use {
      "akinsho/toggleterm.nvim",
      config = function()
        require "config.misc.toggleterm"
      end,
    }
    use {
      "pwntester/octo.nvim",
      cmd = "Octo",
      config = function()
        require("octo").setup()
      end,
    }
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup {}
      end,
    }
    use {
      "jbyuki/venn.nvim",
      config = function()
        vim.api.nvim_create_user_command("VennToggle", require("config.misc.venn").toggle_venn, {})
      end,
    }
    -- { "machakann/vim-sandwich" })
    use {
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
        require("nvim-surround").setup { highlights = { duration = 0 } }
      end,
    }
    use {
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
    }
    use {
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
    }
    use {
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
    }
    use {
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
    }
    use {
      "RRethy/vim-illuminate",
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
    }
    use {
      "nvim-neo-tree/neo-tree.nvim",
      requires = { "s1n7ax/nvim-window-picker" },
      config = function()
        require "config.misc.neo-tree"
      end,
    }
    use {
      "folke/persistence.nvim",
      config = function()
        require("persistence").setup()
      end,
    }
    use {
      "andrewferrier/textobj-diagnostic.nvim",
      config = function()
        require("textobj-diagnostic").setup()
      end,
    }
    use {
      "glepnir/hlsearch.nvim",
      event = "BufRead",
      config = function()
        require("hlsearch").setup()
      end,
    }
    use {
      "Darazaki/indent-o-matic",
      config = function()
        require("indent-o-matic").setup {
          max_lines = 5000,
        }
      end,
    }
    use {
      "rest-nvim/rest.nvim",
      ft = "http",
      config = function()
        require("rest-nvim").setup()
      end,
    }
    use {
      "vigoux/notifier.nvim",
      config = function()
        require("notifier").setup()
      end,
    }
    use { "xiyaowong/virtcolumn.nvim" }

    -- Lua development
    use { "rafcamlet/nvim-luapad", cmd = "Luapad" }
    use {
      "AckslD/messages.nvim",
      config = function()
        require("messages").setup()
        _G.Map = function(...)
          require("messages.api").capture_thing(...)
        end
      end,
    }
  end,
}
