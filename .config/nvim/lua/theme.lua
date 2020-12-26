local cmd = vim.cmd

cmd('set termguicolors')

cmd('colorscheme toast')
vim.o.background = 'dark'

cmd('highlight Normal guibg=NONE')
cmd('highlight NonText guibg=NONE')
cmd('highlight SignColumn ctermbg=NONE guibg=NONE')
cmd('highlight VertSplit ctermbg=NONE guibg=NONE')

cmd('highlight LspDiagnosticsDefaultWarning guifg=Orange')
cmd('highlight LspDiagnosticsDefaultError guifg=Red')
cmd('highlight LspDiagnosticsDefaultHint guifg=LightGrey')
cmd('highlight LspDiagnosticsDefaultInformation guifg=LightBlue')

cmd('highlight DiffAdd cterm=NONE gui=NONE ctermbg=NONE guibg=NONE')
cmd('highlight DiffChange cterm=NONE gui=NONE ctermbg=NONE guibg=NONE')
cmd('highlight DiffDelete cterm=NONE gui=NONE ctermbg=NONE guibg=NONE')

cmd('highlight CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White')
