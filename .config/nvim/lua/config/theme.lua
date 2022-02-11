local cmd = vim.api.nvim_command

vim.g.substrata_italic_comments = true
vim.g.substrata_italic_booleans = true
vim.g.substrata_italic_functions = true
vim.g.substrata_transparent = true
cmd("colorscheme substrata")

local hl = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

hl("Normal", { bg = "NONE" })
hl("NormalFloat", { bg = "#222222" })
hl("FloatBorder", { bg = "#222222" })
hl("LineNr", { fg = "#4F4F4F", bg = "NONE" })
hl("CursorLineNr", { fg = "white", bg = "NONE" })
hl("SignColumn", { fg = "NONE", bg = "NONE" })
hl("EndOfBuffer", { bg = "NONE" })
hl("ModeMsg", { fg = "white" })
hl("Folded", { fg = "#FAB863", bg = "#222222" })
hl("StatusLine", { fg = "NONE", bg = "#181818" })
hl("StatusLineNC", { fg = "NONE", bg = "#181818" })
hl("VertSplit", { fg = "#4F4F4F", bg = "NONE" })

-- Telescope
hl("TelescopeNormal", { bg = "#1F1F1F" })
hl("TelescopePromptNormal", { bg = "#2F2F2F" })
hl("TelescopeBorder", { bg = "#1F1F1F" })
hl("TelescopePreviewBorder", { fg = "#1F1F1F", bg = "#1F1F1F" })
hl("TelescopePromptBorder", { fg = "#2F2F2F", bg = "#2F2F2F" })
hl("TelescopeResultsBorder", { fg = "#1F1F1F", bg = "#1F1F1F" })
hl("TelescopeTitle", { fg = "#1F1F1F", bg = "#A0B9D8" })
hl("TelescopePreviewTitle", { fg = "#1F1F1F", bg = "#A0B9D8" })
hl("TelescopePromptTitle", { fg = "#1F1F1F", bg = "#A0B9D8" })
hl("TelescopePromptCounter", { fg = "#A0B9D8" })
hl("TelescopePromptPrefix", { fg = "#A0B9D8" })

-- hl("DiagnosticError", { bg = "#462215" })
-- hl("DiagnosticWarn", { bg = "#332B16" })
-- hl("DiagnosticHint", { bg = "#1D2F31" })
-- hl("DiagnosticInfo", { bg = "#232C38" })

-- Completion-related
hl("Pmenu", { bg = "#292927" })
hl("PmenuSel", { fg = "NONE", bg = "#393937" })
hl("CmpItemAbbrMatch", { fg = "#A0B9D8" })
hl("CmpItemAbbrMatchFuzzy", { fg = "#CF8164" })
hl("CmpItemAbbr", { fg = "#777777" })
hl("CmpItemKindText", { italic = true, bg = "NONE", fg = "#CDD3DE" })
hl("CmpItemKindMethod", { italic = true, bg = "NONE", fg = "#6699CC" })
hl("CmpItemKindFunction", { italic = true, bg = "NONE", fg = "#FAB863" })
hl("CmpItemKindConstructor", { italic = true, bg = "NONE", fg = "#EC5F67" })
hl("CmpItemKindField", { italic = true, bg = "NONE", fg = "#6699CC" })
hl("CmpItemKindVariable", { italic = true, bg = "NONE", fg = "#62B3B2" })
hl("CmpItemKindClass", { italic = true, bg = "NONE", fg = "#7DC030" })
hl("CmpItemKindInterface", { italic = true, bg = "NONE", fg = "#F99157" })
hl("CmpItemKindModule", { italic = true, bg = "NONE", fg = "#F99157" })
hl("CmpItemKindProperty", { italic = true, bg = "NONE", fg = "#6699CC" })
hl("CmpItemKindUnit", { italic = true, bg = "NONE", fg = "#6699CC" })
hl("CmpItemKindValue", { italic = true, bg = "NONE", fg = "#C3D2DF" })
hl("CmpItemKindEnum", { italic = true, bg = "NONE", fg = "#F99157" })
hl("CmpItemKindKeyword", { italic = true, bg = "NONE", fg = "#99C794" })
hl("CmpItemKindSnippet", { italic = true, bg = "NONE", fg = "#FAC863" })
hl("CmpItemKindColor", { italic = true, bg = "NONE", fg = "#C3D2DF" })
hl("CmpItemKindFile", { italic = true, bg = "NONE", fg = "#C584C5" })
hl("CmpItemKindReference", { italic = true, bg = "NONE", fg = "#62B3B2" })
hl("CmpItemKindFolder", { italic = true, bg = "NONE", fg = "#C574C5" })
hl("CmpItemKindEnumMember", { italic = true, bg = "NONE", fg = "#6699CC" })
hl("CmpItemKindConstant", { italic = true, bg = "NONE", fg = "#C3D2DF" })
hl("CmpItemKindStruct", { italic = true, bg = "NONE", fg = "#EC5F67" })
hl("CmpItemKindEvent", { italic = true, bg = "NONE", fg = "#62B3B2" })
hl("CmpItemKindOperator", { italic = true, bg = "NONE", fg = "#65737E" })
hl("CmpItemKindTypeParameter", { italic = true, bg = "NONE", fg = "#6699CC" })

-- git-messenger
hl("gitMessengerPopupNormal", { link = "NormalFloat" })

-- nvim-bufferline
hl("BufferLineBackground", { bg = "#222222" })

--nvim-tree.lua
hl("NvimTreeFolderIcon", { fg = "gray" })
