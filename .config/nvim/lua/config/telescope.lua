local tele = require("telescope")
local themes = require("telescope.themes")

tele.load_extension("fzy_native")
tele.load_extension("bibtex")
tele.load_extension("session-lens")
tele.load_extension("fzf")
tele.load_extension("heading")

tele.setup({
  defaults = {
    extensions = {
      frecency = {
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = { "*.git/*", "*/tmp/*", "node_modules/*" },
      },
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
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
      --[[ height = 1,
      width = 0.8 ]]
    },
    path_display = {
      "absolute",
    },
    prompt_prefix = " 🔍 ",
    color_devicons = true,
    windblend = 0.2,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    file_ignore_patterns = { "__pycache__/*", "__init__.py", "%.env", "node_modules/*", "scratch/.*" },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    set_env = { ["COLORTERM"] = "truecolor" },
    use_less = false,
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<esc>"] = require("telescope.actions").close,
      },
    },
  },
})

local ivy_config = {
  layout_config = {
    height = 13,
  },
}

local M = {}

function M.lsp_workspace_diagnostic_ivy()
  local opts = themes.get_ivy(ivy_config)
  require("telescope.builtin").lsp_workspace_diagnostics(opts)
end

-- ??????
return setmetatable({}, {
  __index = function(_, k)
    if M[k] then
      return M[k]
    end
  end,
})
