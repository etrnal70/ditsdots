require('telescope').load_extension('fzy_native')

local tele = require('telescope')

vim.cmd[[noremap <silent><C-f> <cmd>lua require'telescope.builtin'.find_files{}<CR>]]
vim.cmd[[nnoremap <silent><C-p> <cmd>lua require'telescope.builtin'.git_files{}<CR>]]
vim.cmd[[noremap <silent><Leader>ls <cmd>lua require'telescope.builtin'.live_grep{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lb <cmd>lua require'telescope.builtin'.buffers{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lt <cmd>lua require'telescope.builtin'.treesitter{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lq <cmd>lua require'telescope.builtin'.quickfix{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lh <cmd>lua require'telescope.builtin'.oldfiles{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lm <cmd>lua require'telescope.builtin'.marks{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lg <cmd>lua require'telescope.builtin'.git_commits{}<CR>]]

tele.setup{
  defaults = {
    extensions = {
	fzy_native = {
	    override_generic_sorter = false,
            override_file_sorter = true,
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
    -- Let's try buffer preview for fanciness
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, 
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    --
    prompt_prefix= " 🔍 ",
    color_devicons = true,
    layout_strategy = "flex",
    preview_cutoff = 120,
    windblend = 0.2,
    results_height = 1,
    results_width = 0.8,
    file_ignore_patterns = {"__pycache__/*","__init__.py", "%.env", "node_modules/*", "scratch/.*"},
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    set_env = {['COLORTERM'] = 'truecolor'},
    shorten_path = true,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  }
}
