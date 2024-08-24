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
          hint_prefix = {
            above = "↙ ",
            current = "← ",
            below = "↖ ",
          },
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
            preview_win_opts = {
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
        "Wansmer/symbol-usage.nvim",
        event = "LspAttach",
        config = function()
          local function h(name)
            return vim.api.nvim_get_hl(0, { name = name })
          end

          -- hl-groups can have any name
          vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg, italic = true })
          vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("CursorLine").bg, fg = h("Comment").fg, italic = true })
          vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("CursorLine").bg, italic = true })
          vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("CursorLine").bg, italic = true })
          vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("CursorLine").bg, italic = true })

          local function text_format(symbol)
            local res = {}

            local round_start = { "", "SymbolUsageRounding" }
            local round_end = { "", "SymbolUsageRounding" }

            -- Indicator that shows if there are any other symbols in the same line
            local stacked_functions_content = symbol.stacked_count > 0 and ("+%s"):format(symbol.stacked_count) or ""

            if symbol.references then
              local usage = symbol.references <= 1 and "usage" or "usages"
              local num = symbol.references == 0 and "no" or symbol.references
              table.insert(res, round_start)
              table.insert(res, { "󰌹 ", "SymbolUsageRef" })
              table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
              table.insert(res, round_end)
            end

            if symbol.definition then
              if #res > 0 then
                table.insert(res, { " ", "NonText" })
              end
              table.insert(res, round_start)
              table.insert(res, { "󰳽 ", "SymbolUsageDef" })
              table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
              table.insert(res, round_end)
            end

            if symbol.implementation then
              if #res > 0 then
                table.insert(res, { " ", "NonText" })
              end
              table.insert(res, round_start)
              table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
              table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
              table.insert(res, round_end)
            end

            if stacked_functions_content ~= "" then
              if #res > 0 then
                table.insert(res, { " ", "NonText" })
              end
              table.insert(res, round_start)
              table.insert(res, { " ", "SymbolUsageImpl" })
              table.insert(res, { stacked_functions_content, "SymbolUsageContent" })
              table.insert(res, round_end)
            end

            return res
          end

          require("symbol-usage").setup {
            text_format = text_format,
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
        -- "brenoprata10/nvim-highlight-colors",
        dir = "~/.local/share/nvim/lazy/nvim-highlight-colors",
        opts = {
          render = "virtual",
          virtual_symbol = "⏺",
        },
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
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
      },
    },
  },
}
