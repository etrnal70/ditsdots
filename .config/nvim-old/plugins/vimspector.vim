"================Vimspector====================
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dl :call vimspector#Launch()<CR>
nmap <leader>dr :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
