lua <<EOF
  local on_attach_vim = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
  end

  require'nvim_lsp'.ccls.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}

EOF

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <Leader>a <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> [g <cmd>:DiagnosticPrev<CR>
nnoremap <silent> ]g <cmd>:DiagnosticNext<CR>

autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
