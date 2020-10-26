"-------------------PLUGIN CONFIG----------------------------

"================Vim-Crates===================
highlight Crates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link Crates WarningMsg

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

"================Dadbod-UI====================
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_winwidth = 30
let g:db_ui_save_location = '~/Queries'

"==============Telescope.nvim=================
lua <<EOF
-- totally optional to use setup
require('telescope').setup{
  defaults = {
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

nnoremap <silent><C-p> <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent><Leader>lg <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <silent><Leader>ls <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <silent><Leader>lb <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <silent><Leader>lt <cmd>lua require'telescope.builtin'.treesitter{}<CR>


"================Vimspector====================
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dl :call vimspector#Launch()<CR>
nmap <leader>dr :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

"================Vim-Move======================
let g:move_key_modifier = 'A-S'

"================Vim Autoformat================
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"===============gen_tags.vim===================
let g:gen_tags#gtags_default_map = 1
