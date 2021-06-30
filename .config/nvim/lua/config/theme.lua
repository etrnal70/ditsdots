local cmd = vim.api.nvim_command

-- #######################################
-- #####         Colorscheme         #####
-- #######################################
vim.g.one_nvim_transparent_bg = true  -- Enable one-nvim transparency support
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1
cmd('colorscheme OceanicNext')

cmd('highlight Normal guibg=NONE ctermbg=NONE')    -- Make background transparent
cmd('highlight LineNr guibg=NONE ctermbg=NONE')
cmd('highlight SignColumn guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE')
cmd('highlight EndOfBuffer guibg=NONE ctermbg=NONE')
cmd('highlight CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White')
cmd('highlight LineNr guifg=#4F4F4F')
cmd('highlight ModeMsg guifg=White')
cmd('highlight Search guifg=#CFCFCF guibg=#4F4F4F')

cmd('highlight DiffAdd guibg=NONE ctermbg=NONE')
cmd('highlight DiffChange guibg=NONE ctermbg=NONE')
cmd('highlight DiffChangeDelete guibg=NONE ctermbg=NONE')
cmd('highlight DiffDelete guibg=NONE ctermbg=NONE')

cmd('highlight StatusLine gui=NONE guifg=NONE guibg=NONE')
cmd('highlight StatusLineNC gui=NONE guifg=NONE guibg=NONE')
cmd('highlight VertSplit gui=NONE guifg=#4F4F4F guibg=NONE')
cmd('highlight Pmenu guibg=#292927')

cmd('highlight DiffAdded guibg=#46A73B')
cmd('highlight DiffRemoved guibg=#E80C19')

-- lsp-saga
cmd('highlight LspSagaDocTruncateLine guifg=#B3DEEF')
