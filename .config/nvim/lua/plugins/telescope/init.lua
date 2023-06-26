return {
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
      local themes = require "telescope.themes"

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
              ["<S-Tab>"] = actions.move_selection_previous,
              ["<Tab>"] = actions.move_selection_next,
              ["<esc>"] = actions.close,
              ["<C-o>"] = actions.toggle_selection,
              ["<C-O>"] = actions.toggle_all,
            },
          },
        },
        extensions = {
          ["fzf"] = {
            fuzzy = true,
            override_generic_sorter = false,
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
          diagnostics = default_ivy,
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
}
