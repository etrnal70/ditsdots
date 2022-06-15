local tele = require("telescope")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

local default_ivy = {
  theme = "ivy",
  layout_config = { height = 13 },
}

tele.setup({
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
    ["ui-select"] = themes.get_dropdown({
      initial_mode = "normal",
      layout_config = {
        height = 12,
        width = 60,
      },
    }),
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
  },
})

-- Load telescope extension
tele.load_extension("fzf")
tele.load_extension("ui-select")
