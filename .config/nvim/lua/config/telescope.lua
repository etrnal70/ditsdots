local tele = require("telescope")
local actions = require("telescope.actions")

tele.setup({
  defaults = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
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
    path_display = {
      "absolute",
    },
    prompt_prefix = " ➤ ",
    selection_caret = " • ",
    color_devicons = true,
    windblend = 10,
    file_ignore_patterns = {
      "__pycache__/*",
      "__init__.py",
      "%.env",
      "node_modules/*",
      "scratch/.*",
      "%.dll",
      "go/pkg/*",
    },
    use_less = false,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<C-o>"] = actions.toggle_selection,
      },
    },
  },
  pickers = {
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
        },
      },
    },
    lsp_definitions = {
      theme = "ivy",
      layout_config = { height = 13 },
    },
    lsp_references = {
      theme = "ivy",
      layout_config = { height = 13 },
    },
    lsp_workspace_diagnostics = {
      theme = "ivy",
      layout_config = { height = 13 },
    },
  },
})

-- Load telescope extension
tele.load_extension("bibtex")
tele.load_extension("fzf")
tele.load_extension("heading")
