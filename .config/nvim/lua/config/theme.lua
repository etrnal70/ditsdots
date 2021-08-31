local cmd = vim.api.nvim_command

vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1
cmd("colorscheme OceanicNext")

cmd("highlight Normal guibg=NONE ctermbg=NONE")
cmd("highlight LineNr guifg=#4F4F4F guibg=NONE ctermbg=NONE")
cmd("highlight CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White")
cmd("highlight SignColumn guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE")
cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
cmd("highlight ModeMsg guifg=White")
cmd("highlight Search guifg=#CFCFCF guibg=#4F4F4F")
cmd("highlight PmenuSel guibg=#4F4F4F")
cmd("highlight Folded guibg=#2F2F2F guifg=#999999")

cmd("highlight DiffAdd guibg=NONE ctermbg=NONE")
cmd("highlight DiffChange guibg=NONE ctermbg=NONE")
cmd("highlight DiffChangeDelete guibg=NONE ctermbg=NONE")
cmd("highlight DiffDelete guibg=NONE ctermbg=NONE")

cmd("highlight StatusLine gui=NONE guifg=NONE guibg=#222222")
cmd("highlight StatusLineNC gui=NONE guifg=NONE guibg=#222222")
cmd("highlight VertSplit gui=NONE guifg=#4F4F4F guibg=NONE")
cmd("highlight Pmenu guibg=#292927")

cmd("highlight DiffAdded guifg=#66BB6A guibg=NONE")
cmd("highlight DiffRemoved guifg=#EF5350 guibg=NONE")

cmd("highlight Todo guibg=NONE")

-- lsp-saga
cmd("highlight LspSagaDocTruncateLine guifg=#6F6F6F")
cmd("hi! link LspFloatWinNormal NormalFloat")
cmd("hi LspFloatWinBorder guibg=#292927 guifg=#292927")
cmd("hi LspSagaHoverBorder guibg=#292927 guifg=#292927 ")

-- git-messenger
cmd("hi link gitMessengerPopupNormal NormalFloat")

-- orgmode.nvim
cmd("highlight OrgTODO guifg=Red")
cmd("highlight OrgDONE guifg=Green")
cmd("highlight OrgAgendaDeadline guifg=Red")
cmd("highlight OrgAgendaScheduled guifg=Green")
cmd("highlight OrgAgendaScheduledPast guifg=Orange")

-- nvim-bufferline
cmd("highlight BufferLineBackground guibg=#222222")
cmd("highlight BufferLineTab guifg=#FFFFFF")
cmd("highlight BufferLineTabSelected guifg=#FFFFFF")
