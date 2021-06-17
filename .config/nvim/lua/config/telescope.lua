local tele = require('telescope')
local themes = require('telescope.themes')

tele.load_extension('fzy_native')
tele.load_extension('bibtex')
tele.load_extension('session-lens')
tele.load_extension('gh')
tele.load_extension('fzf')

tele.setup{
  defaults = {
    extensions = {
      frecency = {
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = {"*.git/*", "*/tmp/*", "node_modules/*"},
      },
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case"
      }
    },
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    prompt_prefix= " 🔍 ",
    color_devicons = true,
    layout_strategy = "flex",
    preview_cutoff = 140,
    windblend = 0.2,
    results_height = 1,
    results_width = 0.8,
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    file_ignore_patterns = {"__pycache__/*","__init__.py", "%.env", "node_modules/*", "scratch/.*"},
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    set_env = {['COLORTERM'] = 'truecolor'},
    shorten_path = true,
    use_less = false,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<esc>"] = require('telescope.actions').close,
      },
    },
  }
}

local ivy_config = {
  layout_config = {
    height = 17
  }
}

local M = {}

function M.lsp_workspace_diagnostic_ivy()
  local opts = themes.get_ivy(ivy_config)
  require("telescope.builtin").lsp_workspace_diagnostics(opts)
end

-- ??????
return setmetatable({},{
  __index = function(_, k)
    if M[k] then
      return M[k]
    end
  end
})
