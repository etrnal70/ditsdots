local cmd = vim.api.nvim_command

vim.g.substrata_italic_comments = true
vim.g.substrata_italic_booleans = true
vim.g.substrata_italic_functions = true
vim.g.substrata_transparent = true
cmd("colorscheme substrata")

cmd("hi Normal guibg=NONE")
cmd("hi NormalFloat guibg=#222222")
cmd("hi FloatBorder guibg=#222222")

cmd("hi LineNr guifg=#4F4F4F guibg=NONE ctermbg=NONE")
cmd("hi CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White")
cmd("hi SignColumn guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE")
cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
cmd("hi ModeMsg guifg=White")
-- cmd("hi Search guifg=#CFCFCF guibg=#4F4F4F")
cmd("hi Folded guibg=#2F2F2F guifg=#999999")

cmd("hi DiffAdd gui=NONE guibg=NONE")
cmd("hi DiffChange gui=NONE guibg=NONE")
cmd("hi DiffChangeDelete gui=NONE guibg=NONE")
cmd("hi DiffDelete gui=NONE guibg=NONE")

cmd("hi StatusLine gui=NONE guifg=NONE guibg=#181818")
cmd("hi StatusLineNC gui=NONE guifg=NONE guibg=#181818")
cmd("hi VertSplit gui=NONE guifg=#4F4F4F guibg=NONE")

cmd("hi DiffAdded guifg=#66BB6A guibg=NONE")
cmd("hi DiffRemoved guifg=#EF5350 guibg=NONE")

-- Completion-related
cmd("hi Pmenu guibg=#292927 guifg=#777777")
cmd("hi PmenuSel guibg=#4F4F4F guifg=#DDDDDD")
cmd("hi! def link CmpItemMenu Pmenu")
cmd("hi! def link CmpItemAbbr Pmenu")
cmd("hi CmpItemKind guibg=#292927 guifg=#AB924C")

-- symbols-outline
cmd("hi FocusedSymbol gui=bold guifg=#FFFFFF")

-- git-messenger
cmd("hi link gitMessengerPopupNormal NormalFloat")

-- nvim-bufferline
cmd("hi BufferLineBackground guibg=#222222")
cmd("hi BufferLineTab guifg=#FFFFFF")
cmd("hi BufferLineTabSelected guifg=#FFFFFF")

--nvim-tree.lua
cmd("hi NvimTreeFolderIcon guifg=gray")

-- vim-illuminate
cmd("hi! def link LspReferenceText CursorLine")
cmd("hi! def link LspReferenceWrite CursorLine")
cmd("hi! def link LspReferenceRead CursorLine")
