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
cmd("hi Pmenu guibg=#292927")
cmd("hi PmenuSel guibg=#393937 guifg=#CCCCCC")
cmd("hi! CmpItemAbbrMatch guifg=#A0B9D8")
cmd("hi! CmpItemAbbrMatchFuzzy guifg=#CF8164")
cmd("hi! CmpItemAbbr guifg=#777777")

-- Define CompletionItemKind highlight
cmd("hi! CmpItemKindText gui=italic guibg=NONE guifg=#CDD3DE")
cmd("hi! CmpItemKindMethod gui=italic guibg=NONE guifg=#6699CC")
cmd("hi! CmpItemKindFunction gui=italic guibg=NONE guifg=#FAB863")
cmd("hi! CmpItemKindConstructor gui=italic guibg=NONE guifg=#EC5F67")
cmd("hi! CmpItemKindField gui=italic guibg=NONE guifg=#6699CC")
cmd("hi! CmpItemKindVariable gui=italic guibg=NONE guifg=#62B3B2")
cmd("hi! CmpItemKindClass gui=italic guibg=NONE guifg=#7DC030")
cmd("hi! CmpItemKindInterface gui=italic guibg=NONE guifg=#F99157")
cmd("hi! CmpItemKindModule gui=italic guibg=NONE guifg=#F99157")
cmd("hi! CmpItemKindProperty gui=italic guibg=NONE guifg=#6699CC")
cmd("hi! CmpItemKindUnit gui=italic guibg=NONE guifg=#6699CC")
cmd("hi! CmpItemKindValue gui=italic guibg=NONE guifg=#C3D2DF")
cmd("hi! CmpItemKindEnum gui=italic guibg=NONE guifg=#F99157")
cmd("hi! CmpItemKindKeyword gui=italic guibg=NONE guifg=#99C794")
cmd("hi! CmpItemKindSnippet gui=italic guibg=NONE guifg=#FAC863")
cmd("hi! CmpItemKindColor gui=italic guibg=NONE guifg=#C3D2DF")
cmd("hi! CmpItemKindFile gui=italic guibg=NONE guifg=#C584C5")
cmd("hi! CmpItemKindReference gui=italic guibg=NONE guifg=#62B3B2")
cmd("hi! CmpItemKindFolder gui=italic guibg=NONE guifg=#C574C5")
cmd("hi! CmpItemKindEnumMember gui=italic guibg=NONE guifg=#6699CC")
cmd("hi! CmpItemKindConstant gui=italic guibg=NONE guifg=#C3D2DF")
cmd("hi! CmpItemKindStruct gui=italic guibg=NONE guifg=#EC5F67")
cmd("hi! CmpItemKindEvent gui=italic guibg=NONE guifg=#62B3B2")
cmd("hi! CmpItemKindOperator gui=italic guibg=NONE guifg=#65737E")
cmd("hi! CmpItemKindTypeParameter gui=italic guibg=NONE guifg=#6699CC")


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
