function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '' 
endfunction

function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return   " " . fugitive#head()
  else
     return ''
  endif
endfunction

function! LspDiagnostics() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').diagnostics()")
  endif

  return ''
endfunction

function! LspMessages() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').messages()")
  endif

  return ''
endfunction

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
" ================ Theme =========================
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:bg = ["NONE", "NONE"] 
let s:fg = ["NONE", 7]
let s:fgn = ["NONE", 0]
let s:bn = ["#98c379", 51]
let s:bi = ["#61afef", 82]
let s:br = ["#e06c75", 11]
let s:bv = ["#e5c07b", 9]

let s:p.normal.middle = [ [ s:fg, s:bg ] ]
let s:p.normal.right = [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]
let s:p.normal.warning = [ [ s:fg, s:bv ] ]
let s:p.normal.error = [ [ s:fg, s:bv ] ]

let s:p.inactive.left =  [ [ s:fgn, s:bg ], [ s:fg, s:bg ] ]
let s:p.inactive.middle = [ [ s:fg, s:bg ] ]
let s:p.inactive.right = [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]

let s:p.normal.left = [ [ s:bn, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.insert.left = [ [ s:bi, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.replace.left = [ [ s:br, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.visual.left = [ [ s:bv, s:bg, 'bold' ], [ s:fg, s:bg ] ]

let s:p.tabline.left = [ [ s:fg, s:bg ] ]
let s:p.tabline.middle = [ [ s:fg, s:bg ] ]
let s:p.tabline.right = [ [ s:fg, s:bg ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:fg ] ]

let g:lightline#colorscheme#minimal#palette = lightline#colorscheme#flatten(s:p)



let g:lightline = { 'colorscheme' : 'minimal' }
let g:lightline.active = { 
      \ 'left': [ ['mode', 'readonly'],['git_branch'], ['filename_with_icon', 'modified']],
      \ 'right': [['lineinfo'],['lsp_status']]
      \ }

" let g:lightline.separator = { 'left': "  ", 'right': "  " }
let g:lightline.subseparator = { 'left': '', 'right': '' }
" let g:lightline.tabline_separator = { 'left': " ", 'right': "" }
" let g:lightline.tabline_subseparator = { 'left': "|", 'right': "|" }

let g:lightline.tabline = {'left': [ [ 'vim_logo'], [ 'tabs' ] ]}
let g:lightline.tab = {
        \ 'active': ['filename_with_parent'],
        \ 'inactive': ['filename']
        \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }

let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'vim_logo': "\ue7c5 ",
        \ 'git_branch': '%{Git_branch()}',
        \ 'filename_with_parent': '%t',
        \ 'lsp_diagnostics' : '%{LspDiagnostics()}',
        \ 'lsp_messages' : '%{LspMessages()}',
        \ 'lsp_status' : '%{LspStatus()}',
        \ }
