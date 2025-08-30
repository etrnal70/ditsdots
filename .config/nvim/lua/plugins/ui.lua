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
        if vim.diagnostic.is_enabled then
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
        end

        -- Git Branch
        local git_branch = vim.g.gitsigns_head
        if git_branch and git_branch ~= "" then
          f.add { "  " .. git_branch .. " ", fg = "#222222", bg = "#FF8800", bold = true }
        end
      end,
    },
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>lq", "<cmd>Telescope diagnostics<CR>" },
      { "<leader>lf", "<cmd>Telescope find_files<CR>" },
      { "<leader>lF", "<cmd>Telescope git_files<CR>" },
      { "<leader>gC", "<cmd>Telescope git_commits<CR>" },
      { "<leader>gb", "<cmd>Telescope git_branches<CR>" },
      { "<leader>lc", "<cmd>Telescope commands<CR>" },
      { "<leader>ls", "<cmd>Telescope live_grep<CR>" },
      { "<leader>lb", "<cmd>Telescope buffers<CR>" },
      { "<leader>lo", "<cmd>Telescope oldfiles<CR>" },
      { "<leader>lH", "<cmd>Telescope help_tags<CR>" },
    },
    config = function()
      local tele = require "telescope"
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"

      local downward_strategy = {
        "bottom_pane",
        "cursor",
        "horizontal",
      }

      local default_ivy = {
        theme = "ivy",
        layout_config = { height = 13 },
      }

      tele.setup {
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            flex = {
              flip_columns = 130,
            },
            horizontal = {
              mirror = false,
              width = 0.8,
            },
            vertical = {
              mirror = false,
            },
          },
          path_display = { "truncate" },
          prompt_prefix = "➤  ",
          selection_caret = "• ",
          wrap_results = true,
          file_ignore_patterns = {
            "__pycache__/*",
            "__init__.py",
            "%.env",
            "node_modules/*",
            "scratch/.*",
            "sessions/*",
            "%.dll",
            "go/pkg/*",
          },
          mappings = {
            i = {
              ["<S-Tab>"] = function(prompt_bufnr)
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                if vim.tbl_contains(downward_strategy, current_picker.layout_strategy) then
                  return actions.move_selection_previous(prompt_bufnr)
                else
                  return actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<Tab>"] = function(prompt_bufnr)
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                if vim.tbl_contains(downward_strategy, current_picker.layout_strategy) then
                  return actions.move_selection_next(prompt_bufnr)
                else
                  return actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<esc>"] = actions.close,
              ["<C-o>"] = actions.toggle_selection,
              ["<C-O>"] = actions.toggle_all,
            },
          },
        },
        extensions = {
          ["fzf"] = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
        pickers = {
          commands = {
            theme = "ivy",
            layout_config = { height = 8 },
          },
          find_files = {
            layout_strategy = "flex",
            layout_config = {
              flex = {
                flip_columns = 130,
              },
              horizontal = {
                mirror = false,
                width = 0.8,
              },
              vertical = {
                mirror = false,
                preview_height = 0.65,
              },
            },
          },
          diagnostics = {
            theme = "ivy",
            layout_config = { height = 13 },
            sort_by = "severity",
          },
          lsp_code_actions = {
            initial_mode = "normal",
            theme = "cursor",
            layout_config = { width = 55 },
          },
          lsp_definitions = default_ivy,
          lsp_implementations = default_ivy,
          lsp_references = default_ivy,
          lsp_type_definitions = default_ivy,
          lsp_incoming_calls = default_ivy,
          lsp_outgoing_calls = default_ivy,
        },
      }

      -- Load telescope extension
      tele.load_extension "fzf"
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
  },
  { "nvim-telescope/telescope-bibtex.nvim", ft = { "tex", "bib" }, dependencies = "telescope.nvim" },
  {
    "crispgm/telescope-heading.nvim",
    ft = "markdown",
    config = function()
      require("telescope").load_extension "heading"
      vim.keymap.set("n", "<leader>lh", ":Telescope heading theme=ivy<CR>", { silent = true })
    end,
    dependencies = "telescope.nvim",
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
      -- icon = {
      --   folder_empty = "󰜌",
      --   folder_empty_open = "󰜌",
      -- },
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
          end,
        },
      },
      filesystem = {
        async_directory_scan = "always",
        hijack_netrw_behavior = "disabled",
        filtered_items = {
          hide_by_name = {
            "node_modules",
            "__pycache__",
          },
          always_show = {
            ".github",
            ".kube",
          },
        },
        window = {
          fuzzy_finder_mappings = {
            ["<down>"] = "move_cursor_down",
            ["<C-j>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-k>"] = "move_cursor_up",
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
        enabled = true,
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
            sign = { namespace = { "gitsigns_signs_" }, maxwidth = 1, colwidth = 1, auto = false },
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
    "lewis6991/satellite.nvim",
    opts = {
      excluded_filetypes = { "neo-tree" },
      winblend = 0, -- Workaround, winblend broken (black bg)
      handlers = {
        diagnostic = { enable = false },
        gitsigns = { enable = false },
        quickfix = { enable = false },
        cursor = { enable = false },
      },
    },
  },
  { "xiyaowong/virtcolumn.nvim",            event = "VeryLazy" },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>ss", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      require("outline").setup {
        outline_window = {
          wrap = true,
          width = 35,
          relative_width = false,
          show_cursorline = "focus_in_outline",
          hide_cursor = true,
        },
        outline_items = {
          show_symbol_details = true,
        },
        preview_window = {
          auto_preview = true,
          border = require("config.utils").transparent_border,
          width = 30,
          -- winhl = "NormalNC:",
        },
        symbol_folding = {
          autofold_depth = 1,
          auto_unfold = {
            hovered = true,
          },
        },
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
      tint = -35,
      highlight_ignore_patterns = { "WinSeparator", "Status.*", "SymbolUsage.*" },
      window_ignore_function = function(winid)
        local buf = vim.api.nvim_win_get_buf(winid)
        local ft = vim.api.nvim_get_option_value("ft", { buf = buf })

        if ft == "neo-tree" then
          return true
        end

        return false
      end,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufWinEnter",
    dependencies = "kevinhwang91/promise-async",
    opts = {
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" ↙ %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "CmpItemKindSnippet" })
        return newVirtText
      end,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    keys = "<leader>sm",
    opts = {
      direction = "horizontal",
      insert_mappings = false,
      open_mapping = [[<leader>sm]],
      size = function(term)
        if term.direction == "horizontal" then
          return 12
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      start_in_insert = false,
      terminal_mappings = false,
    },
  },
}
