let g:diagnostic_enable_virtual_text = 1
let g:space_before_virtual_text = 5
let g:diagnostic_enable_underline = 1

call sign_define("LspDiagnosticsErrorSign", {"text" : "🛑", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚠️", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "ℹ️", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "💡", "texthl" : "LspDiagnosticsHint"})

nnoremap <silent> [g <cmd>:DiagnosticPrev<CR>
nnoremap <silent> ]g <cmd>:DiagnosticNext<CR>
