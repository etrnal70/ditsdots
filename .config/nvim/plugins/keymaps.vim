"---------------KEYBOARD MAPPING---------------------
let mapleader = ","

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

nnoremap <A-k> :resize +2<CR>
nnoremap <A-j> :resize -2<CR>
nnoremap <A-h> :vertical resize -2<CR>
nnoremap <A-l> :vertical resize +2<CR>

inoremap <A-l> <esc>la
inoremap <A-h> <esc>i
