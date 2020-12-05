local cmd = vim.cmd

cmd[[map sh <C-w>h]]
cmd[[map sk <C-w>k]]
cmd[[map sj <C-w>j]]
cmd[[map sl <C-w>l]]

cmd[[nnoremap <A-k> :resize +2<CR>]]
cmd[[nnoremap <A-j> :resize -2<CR>]]
cmd[[nnoremap <A-h> :vertical resize -2<CR>]]
cmd[[nnoremap <A-l> :vertical resize +2<CR>]]

cmd[[inoremap <A-l> <esc>la]]
cmd[[inoremap <A-h> <esc>i]]
