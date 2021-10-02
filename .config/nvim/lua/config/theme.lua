local cmd = vim.api.nvim_command

vim.g.substrata_italic_comments = true
vim.g.substrata_italic_booleans = true
vim.g.substrata_italic_functions = true
cmd("colorscheme substrata")

cmd("highlight Normal guibg=NONE")
cmd("highlight NormalFloat guibg=#222222")
cmd("highlight FloatBorder guibg=#222222")

cmd("highlight LineNr guifg=#4F4F4F guibg=NONE ctermbg=NONE")
cmd("highlight CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White")
cmd("highlight SignColumn guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE")
cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
cmd("highlight ModeMsg guifg=White")
-- cmd("highlight Search guifg=#CFCFCF guibg=#4F4F4F")
-- cmd("highlight PmenuSel guibg=#4F4F4F")
cmd("highlight Folded guibg=#2F2F2F guifg=#999999")

cmd("highlight DiffAdd gui=NONE guibg=NONE")
cmd("highlight DiffChange gui=NONE guibg=NONE")
cmd("highlight DiffChangeDelete gui=NONE guibg=NONE")
cmd("highlight DiffDelete gui=NONE guibg=NONE")

cmd("highlight StatusLine gui=NONE guifg=NONE guibg=#181818")
cmd("highlight StatusLineNC gui=NONE guifg=NONE guibg=#181818")
cmd("highlight VertSplit gui=NONE guifg=#4F4F4F guibg=NONE")
cmd("highlight Pmenu guibg=#292927")

cmd("highlight DiffAdded guifg=#66BB6A guibg=NONE")
cmd("highlight DiffRemoved guifg=#EF5350 guibg=NONE")

cmd("highlight Todo guibg=NONE")

-- symbols-outline
cmd("highlight FocusedSymbol gui=bold guifg=#FFFFFF")

-- git-messenger
cmd("hi link gitMessengerPopupNormal NormalFloat")

-- nvim-bufferline
cmd("highlight BufferLineBackground guibg=#222222")
cmd("highlight BufferLineTab guifg=#FFFFFF")
cmd("highlight BufferLineTabSelected guifg=#FFFFFF")

--nvim-tree.lua
cmd("highlight NvimTreeFolderIcon guifg=gray")
