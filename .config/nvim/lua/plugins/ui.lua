return {
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    opts = {
      theme = "doom",
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
      config = {
        header = {
          "                                        ",
          "                                        ",
          "                                        ",
          "                                        ",
          "                                        ",
          "         //                 /*          ",
          "      ,(/(//,               *###        ",
          "    ((((((////.             /####%*     ",
          " ,/(((((((/////*            /########   ",
          "/*///((((((//////.          *#########/ ",
          "//////((((((((((((/         *#########/.",
          "////////((((((((((((*       *#########/.",
          "/////////(/(((((((((((      *#########(.",
          "//////////.,((((((((((/(    *#########(.",
          "//////////.  /(((((((((((,  *#########(.",
          "(////////(.    (((((((((((( *#########(.",
          "(////////(.     ,#((((((((((##########(.",
          "((//////((.       /#((((((((##%%######(.",
          "((((((((((.         #(((((((####%%##%#(.",
          "((((((((((.          ,((((((#####%%%%%(.",
          " .#(((((((.            (((((#######%%   ",
          "    /(((((.             .(((#%##%%/*    ",
          "      ,(((.               /(#%%#        ",
          "        ./.                 #*          ",
          "                                        ",
          "                                        ",
          "                                        ",
          "                                        ",
          "                                        ",
        },
        center = {
          {
            icon = " ",
            icon_hl = "GitSignsAdd",
            desc = "New File",
            desc_hl = "Text",
            key = "e",
            key_hl = "GitSignsAdd",
            action = "enew",
          },
          {
            icon = "󰮗 ",
            icon_hl = "GitSignsAdd",
            desc = "Find File",
            desc_hl = "Text",
            key = "f",
            key_hl = "GitSignsAdd",
            action = "Telescope find_files",
          },
          {
            icon = " ",
            icon_hl = "GitSignsAdd",
            desc = "Find Text",
            desc_hl = "Text",
            key = "t",
            key_hl = "GitSignsAdd",
            action = "Telescope live_grep",
          },
          {
            icon = "󰗼 ",
            icon_hl = "GitSignsAdd",
            desc = "Quit",
            desc_hl = "Text",
            key = "q",
            key_hl = "GitSignsAdd",
            action = "qa",
          },
        },
        footer = {},
      },
    },
  },
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local custom = require "lualine.themes.ayu_dark"
      custom.normal.c.bg = "#1F1F1F"
      custom.insert.b.bg = "#1F1F1F"
      custom.inactive.c.bg = "#1F1F1F"
      custom.replace.b.bg = "#1F1F1F"
      custom.visual.b.bg = "#1F1F1F"

      require("lualine").setup {
        options = {
          theme = custom,
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
          always_divide_middle = true,
          globalstatuus = false,
        },
        extensions = { "overseer", "aerial", "neo-tree", "toggleterm" },
        sections = {
          lualine_a = {
            {
              "mode",
              color = { fg = "white", bg = "#3F3F3F", gui = "bold" },
              fmt = function(mode)
                return mode:sub(1, 1)
              end,
            },
          },
          lualine_b = {
            {
              "b:gitsigns_blame_line",
              color = { fg = "#888888", bg = "#212121", gui = "italic" },
            },
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {
            {
              "diff",
              diff_color = {
                added = { fg = "#92C47E", bg = "#212121", gui = "italic,bold" },
                modified = { fg = "#D2B45F", bg = "#212121", gui = "italic,bold" },
                removed = { fg = "#FE9F7C", bg = "#212121", gui = "italic,bold" },
              },
              symbols = { added = "  ", modified = "  ", removed = "  " },
            },
          },
          lualine_z = {
            {
              "encoding",
              fmt = function(str)
                return string.upper(str) .. " "
              end,
              color = { fg = "white", bg = "#212121", gui = "italic,bold" },
            },
          },
        },
        inactive_sections = {
          lualine_a = {
            {
              "mode",
              color = { fg = "white", bg = "#3F3F3F", gui = "bold" },
              fmt = function(mode)
                return mode:sub(1, 1)
              end,
            },
          },
          lualine_b = {
            {
              "b:gitsigns_blame_line",
              color = { fg = "#888888", bg = "#212121", gui = "italic" },
            },
          },
          lualine_c = {},
          lualine_x = { "overseer" },
          lualine_y = {
            {
              "diff",
              diff_color = {
                added = { fg = "#92C47E", bg = "#212121", gui = "italic,bold" },
                modified = { fg = "#D2B45F", bg = "#212121", gui = "italic,bold" },
                removed = { fg = "#FE9F7C", bg = "#212121", gui = "italic,bold" },
              },
              symbols = { added = "  ", modified = "  ", removed = "  " },
            },
          },
          lualine_z = {
            {
              "encoding",
              fmt = function(str)
                return string.upper(str)
              end,
              color = { fg = "white", bg = "#212121", gui = "italic,bold" },
            },
          },
        },
      }
    end,
  },
  -- Tabline
  {
    "rafcamlet/tabline-framework.nvim",
    event = "VeryLazy",
    opts = {
      hl = { fg = "#888888", bg = "#222222" },
      hl_sel = { fg = "#000000", bg = "#A0B9D8" },
      hl_fill = { fg = nil, bg = nil },
      render = function(f)
        f.make_tabs(function(info)
          f.add(" Tab " .. info.index .. " ")
          f.add(info.modified and "⏺ ")
        end)

        -- Align to right
        f.add_spacer()

        -- Language-specific
        -- TODO: Might be too expensive
        -- for _, client in pairs(vim.lsp.get_active_clients()) do
        --   if client.name == "dartls" then
        --     if vim.g.flutter_tools_decorations.app_version ~= nil then
        --       f.add({ " " .. vim.g.flutter_tools_decorations.app_version .. " ", fg = "#222222", bg = "#59B3EF" })
        --     end
        --   end
        -- end

        -- Diagnostics
        local errors = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }))
        local warnings = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN }))
        local hints = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.HINT }))

        if errors ~= 0 then
          f.add { "  " .. errors .. " ", fg = "#222222", bg = "#EC5F67" }
        end
        if warnings ~= 0 then
          f.add { "  " .. warnings .. " ", fg = "#222222", bg = "#FABD2F" }
        end
        if hints ~= 0 then
          f.add { " 󰌶 " .. hints .. " ", fg = "#222222", bg = "#A0B9D8" }
        end

        -- Git Branch
        local git_branch = vim.g.gitsigns_head
        if git_branch and git_branch ~= "" then
          f.add { "  " .. git_branch .. " ", fg = "#222222", bg = "#FF8800", bold = true }
        end
      end,
    },
  },
  -- File tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>st", "<cmd>Neotree focus toggle<CR>" },
    },
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        opts = {
          picker_config = {
            statusline_winbar_picker = { use_winbar = "always" },
          },
          highlights = {
            winbar = {
              focused = { bg = "#6699CC" },
              unfocused = { bg = "#2F628E" },
            },
          },
          filter_rules = {
            bo = {
              filetype = { "NvimTree", "neo-tree", "notify" },
              buftype = { "terminal", "nofile" },
            },
          },
        },
      },
      { "miversen33/netman.nvim" },
    },
    opts = {
      sources = {
        "filesystem",
        "netman.ui.neo-tree",
      },
      open_files_in_last_window = false,
      close_if_last_window = true,
      follow_current_file = true,
      default_component_configs = {
        git_status = {
          symbols = {
            added = "✚",
            modified = "⏺",
          },
          align = "right",
        },
        modified = {
          symbol = "⏺",
        },
      },
      -- TODO Remove once nerdfont 3.0 support is merged
      icon = {
        folder_empty = "󰜌",
        folder_empty_open = "󰜌",
      },
      document_symbols = {
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Function = { icon = "󰊕", hl = "Function" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Struct = { icon = "󰌗", hl = "Type" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          StaticMethod = { icon = "󰠄 ", hl = "Function" },
        },
      },
      source_selector = {
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },
      enable_diagnostics = false,
      enable_git_status = true,
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.cursorline = true
            -- vim.cmd "set cursorlineopt=both"
            -- vim.cmd "hi Cursor blend=100"
          end,
        },
        -- {
        --   event = "neo_tree_buffer_leave",
        --   handler = function()
        --     vim.cmd "hi Cursor blend=0"
        --     vim.cmd "set cursorlineopt=number"
        --   end,
        -- },
      },
      filesystem = {
        async_directory_scan = "always",
        hijack_netrw_behavior = "disabled",
        filtered_items = {
          hide_by_name = {
            "node_modules",
            "__pycache__",
          },
        },
      },
      sort_case_insensitive = true,
      use_libuv_file_watcher = true,
      popup_border_style = require("config.utils").transparent_border,
      window = {
        mappings = {
          ["<cr>"] = "open_with_window_picker",
          ["<c-x>"] = "split_with_window_picker",
          ["<c-v>"] = "vsplit_with_window_picker",
          ["s"] = "none",
          ["S"] = "none",
          [","] = "navigate_up",
          ["<c-t>"] = "open_tabnew",
          o = function(state)
            vim.cmd("silent !/bin/bash -c 'xdg-open " .. state.tree:get_node():get_id() .. "'")
          end,
          ["<C-z>"] = "clear_filter",
        },
        width = 35,
      },
    },
  },
}
