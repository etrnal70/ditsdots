"================Vim-Crates===================
highlight Crates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link Crates WarningMsg

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

