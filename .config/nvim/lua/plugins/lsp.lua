return {
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
        "j-hui/fidget.nvim",
        opts = {
          progress = {
            ignore_done_already = true,
            display = {
              progress_ttl = 25,
              render_limit = 5,
            },
          },
          notification = {
            -- filter = vim.log.levels.WARN,
            override_vim_notify = true,
            window = { winblend = 0, max_width = 75 },
          },
        },
      },
      {
        "DNLHC/glance.nvim",
        config = function()
          local actions = require("glance").actions
          require("glance").setup {
            indent_lines = {
              enable = true,
              icon = "  •",
            },
            preview_win_opts = { -- Configure preview window options
              cursorline = true,
              number = true,
              wrap = true,
            },
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
        "zbirenbaum/neodim",
        event = "LspAttach",
        opts = {
          refresh_delay = 250,
          alpha = 0.45,
          blend_color = "#000000",
          hide = {
            underline = true,
            virtual_text = true,
            signs = true,
          },
          regex = {
            "[uU]nused",
            "[nN]ever [rR]ead",
            "[nN]ot [rR]ead",
          },
          priority = 128,
          disable = {},
        },
      },
      {
        "lvimuser/document-color.nvim",
        config = true,
      },
      "yioneko/nvim-type-fmt",
      "p00f/clangd_extensions.nvim",
      "akinsho/flutter-tools.nvim",
      {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        init = function()
          vim.g.rustaceanvim = {
            tools = {
              code_actions = { ui_select_fallback = true },
              hover_actions = { replace_builtin_hover = false },
            },
          }
        end,
      },
      "mfussenegger/nvim-jdtls",
      "b0o/schemastore.nvim",
      {
        "pmizio/typescript-tools.nvim",
        opts = {
          settings = {
            code_lens = "implementations_only",
          },
        },
      },
      {
        "folke/neodev.nvim",
        opts = {},
      },
    },
  },
}
