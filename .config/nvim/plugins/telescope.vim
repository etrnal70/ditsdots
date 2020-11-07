"==============Telescope.nvim=================
lua <<EOF
-- totally optional to use setup
require('telescope').setup{
  defaults = {
    color_devicons = false,
    require('telescope.sorters').get_generic_fuzzy_sorter, 
    shorten_path = true,            -- currently the default value is true
      mappings = {
        i = {
          ["<C-j>"] = require('telescope.actions').move_selection_next,
          ["<C-k>"] = require('telescope.actions').move_selection_previous,
        },
    },
  }
}
EOF

nnoremap <silent><C-f> <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent><C-p> <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <silent><Leader>ls <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <silent><Leader>lb <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <silent><Leader>lt <cmd>lua require'telescope.builtin'.treesitter{}<CR>
nnoremap <silent><Leader>lq <cmd>lua require'telescope.builtin'.quickfix{}<CR>
nnoremap <silent><Leader>lh <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

