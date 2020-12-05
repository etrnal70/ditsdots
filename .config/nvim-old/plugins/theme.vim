"--------------------THEME-----------------------
" Custom highlight group
augroup toast 
  autocmd colorscheme toast hi link CocHintSign Comment
augroup end

set termguicolors
colorscheme toast
set background=dark

" Make vim respect terminal color 
highlight Normal guibg=none
highlight NonText guibg=none

"Hide tilde sign for empty line
set fcs=eob:\  

" Reduce vertical split limiter
hi VertSplit ctermbg=NONE guibg=NONE

" Disable SignColumn background
hi SignColumn ctermbg=NONE guibg=NONE
