vim.g.substrata_italic_comments = true
vim.g.substrata_italic_booleans = true
vim.g.substrata_italic_functions = true
vim.g.substrata_transparent = true
-- vim.cmd.colorscheme("substrata")
vim.cmd.colorscheme("tundra")

local hl = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

hl("Normal", { bg = nil })
hl("NormalNC", { link = "Normal" })
hl("NormalFloat", { bg = "#222222" })
hl("FloatBorder", { bg = "#222222" })
hl("FloatTitle", { bg = nil })
hl("LineNr", { fg = "#4F4F4F", bg = nil })
hl("CursorLine", { bg = "#2F2F2F", bold = true })
hl("CursorLineNr", { fg = "white", bg = nil })

hl("EndOfBuffer", { bg = nil })
hl("ModeMsg", { fg = "white", bg = "#212121" })
hl("MsgArea", { link = "StatusLine" })
hl("Folded", { fg = "#555555", bg = "#140F05" })
hl("StatusLine", { fg = nil, bg = "#1F1F1F" })
hl("StatusLineTerm", { fg = nil, bg = "#1F1F1F" })
hl("StatusLineNC", { link = "WinSeparator" })
hl("StatusLineTermNC", { link = "WinSeparator" })
hl("WinBar", { bg = nil, bold = true })
hl("WinBarNC", { bg = nil, bold = true })
hl("WinSeparator", { fg = "#2F2F2F", bg = nil, bold = true })
hl("TabLineFill", { fg = nil, bg = nil })

hl("GitSignsAdd", { fg = "#92C47E" })
hl("GitSignsChange", { fg = "#D2B45F" })
hl("GitSignsDelete", { fg = "#FE9F7C" })
hl("DiffAdd", { fg = nil, bg = "#152310" })
hl("DiffChange", { fg = nil, bg = "#281F0B" })
hl("DiffDelete", { fg = nil, bg = "#320E01" })
hl("DiffText", { bg = "#3C2E10", bold = true })
hl("diffAdded", { fg = nil, bg = "#152310" })
hl("diffChanged", { fg = nil, bg = "#281F0B" })
hl("diffRemoved", { fg = nil, bg = "#320E01" })

-- hl("TreesitterContext", { bg = "#181818", blend = 100 })
-- hl("TreesitterContextLineNumber", { fg = "#8F8F8F" })

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

-- Completion-related
hl("Pmenu", { bg = "#292927" })
hl("PmenuSel", { fg = nil, bg = "#393937" })
hl("CmpItemAbbrMatch", { fg = "#A0B9D8" })
hl("CmpItemAbbrMatchFuzzy", { fg = "#CF8164" })
hl("CmpItemAbbr", { fg = "#777777" })
hl("CmpItemKindText", { italic = true, bg = nil, fg = "#CDD3DE" })
hl("CmpItemKindMethod", { italic = true, bg = nil, fg = "#6699CC" })
hl("CmpItemKindFunction", { italic = true, bg = nil, fg = "#FAB863" })
hl("CmpItemKindConstructor", { italic = true, bg = nil, fg = "#EC5F67" })
hl("CmpItemKindField", { italic = true, bg = nil, fg = "#6699CC" })
hl("CmpItemKindVariable", { italic = true, bg = nil, fg = "#62B3B2" })
hl("CmpItemKindClass", { italic = true, bg = nil, fg = "#7DC030" })
hl("CmpItemKindInterface", { italic = true, bg = nil, fg = "#F99157" })
hl("CmpItemKindModule", { italic = true, bg = nil, fg = "#F99157" })
hl("CmpItemKindProperty", { italic = true, bg = nil, fg = "#6699CC" })
hl("CmpItemKindUnit", { italic = true, bg = nil, fg = "#6699CC" })
hl("CmpItemKindValue", { italic = true, bg = nil, fg = "#C3D2DF" })
hl("CmpItemKindEnum", { italic = true, bg = nil, fg = "#F99157" })
hl("CmpItemKindKeyword", { italic = true, bg = nil, fg = "#99C794" })
hl("CmpItemKindSnippet", { italic = true, bg = nil, fg = "#FAC863" })
hl("CmpItemKindColor", { italic = true, bg = nil, fg = "#C3D2DF" })
hl("CmpItemKindFile", { italic = true, bg = nil, fg = "#C584C5" })
hl("CmpItemKindReference", { italic = true, bg = nil, fg = "#62B3B2" })
hl("CmpItemKindFolder", { italic = true, bg = nil, fg = "#C574C5" })
hl("CmpItemKindEnumMember", { italic = true, bg = nil, fg = "#6699CC" })
hl("CmpItemKindConstant", { italic = true, bg = nil, fg = "#C3D2DF" })
hl("CmpItemKindStruct", { italic = true, bg = nil, fg = "#EC5F67" })
hl("CmpItemKindEvent", { italic = true, bg = nil, fg = "#62B3B2" })
hl("CmpItemKindOperator", { italic = true, bg = nil, fg = "#65737E" })
hl("CmpItemKindTypeParameter", { italic = true, bg = nil, fg = "#6699CC" })

-- Semantic Tokens
hl("LspNamespace", { link = "TSNamespace" })
hl("LspType", { link = "TSType" })
hl("LspClass", { link = "TSClass" })
hl("LspEnum", { link = "TSEnum" })
hl("LspInterface", { link = "TSInterface" })
hl("LspStruct", { link = "Structure" })
hl("LspTypeParameter", { link = "TSParameter" })
hl("LspParameter", { link = "TSParameter" })
hl("LspVariable", { link = "TSVariable" })
hl("LspProperty", { link = "TSProperty" })
hl("LspEnumMember", { link = "Constant" })
hl("LspEvent", { link = "Keyword" })
hl("LspFunction", { link = "TSFunction" })
hl("LspMethod", { link = "TSMethod" })
hl("LspMacro", { link = "TSFuncMacro" })
hl("LspKeyword", { link = "TSKeyword" })
hl("LspModifier", { link = "StorageClass" })
hl("LspComment", { link = "TSComment" })
hl("LspString", { link = "TSString" })
hl("LspNumber", { link = "TSNumber" })
hl("LspRegexp", { link = "TSStringRegex" })
hl("LspOperator", { link = "TSOperator" })

-- LSP-related
hl("LspInlayHint", { fg = "#6E6F70", bg = "#16161F" })
hl("LspReferenceRead", { link = "CursorLine" })
hl("LspReferenceText", { link = "CursorLine" })
hl("LspReferenceWrite", { link = "CursorLine" })
hl("LspSignatureActiveParameter", { bg = "#404040", bold = true, italic = true })
hl("LspCodeLens", { fg = "#666666", bold = true })
hl("LspCodeLensText", { link = "LspCodeLens" })
hl("LspCodeLensTextSign", { fg = "#777777" })
hl("LspCodeLensSeparator", { fg = "#333333", bold = true })
hl("LspCodeLensTextSeparator", { link = "LspCodeLensSeparator" })

-- fidget.nvim
hl("FidgetTitle", { fg = "#A0B9D8" })
hl("FidgetTask", { fg = "#555555" })

-- symbols-outline
-- hl("FocusedSymbol", { link = "CursorLine" })

-- git-messenger
hl("gitMessengerPopupNormal", { link = "NormalFloat" })

-- vim-illuminate
hl("IlluminatedWordText", { bg = "#1F1F1F" })
hl("IlluminatedWordRead", { link = "IlluminatedWordText" })
hl("IlluminatedWordWrite", { link = "IlluminatedWordText" })

-- conflict-marker
hl("ConflictMarkerBegin", { bg = "#2F7366" })
hl("ConflictMarkerOurs", { bg = "#2E5049" })
hl("ConflictMarkerTheirs", { bg = "#344F69" })
hl("ConflictMarkerEnd", { bg = "#2F628E" })
hl("ConflictMarkerCommonAncestorsHunk", { bg = "#754A81" })

-- nvim-navic
hl("NavicText", { fg = "#AAAAAA" })
hl("NavicIconsNamespace", { link = "CmpItemKindNamespace" })
hl("NavicIconsType", { link = "CmpItemKindType" })
hl("NavicIconsClass", { link = "CmpItemKindClass" })
hl("NavicIconsEnum", { link = "CmpItemKindEnum" })
hl("NavicIconsInterface", { link = "CmpItemKindInterface" })
hl("NavicIconsStruct", { link = "Structure" })
hl("NavicIconsTypeParameter", { link = "CmpItemKindParameter" })
hl("NavicIconsParameter", { link = "CmpItemKindParameter" })
hl("NavicIconsVariable", { link = "CmpItemKindVariable" })
hl("NavicIconsProperty", { link = "CmpItemKindProperty" })
hl("NavicIconsEnumMember", { link = "Constant" })
hl("NavicIconsEvent", { link = "Keyword" })
hl("NavicIconsFunction", { link = "CmpItemKindFunction" })
hl("NavicIconsMethod", { link = "CmpItemKindMethod" })
hl("NavicIconsMacro", { link = "CmpItemKindFuncMacro" })
hl("NavicIconsKeyword", { link = "CmpItemKindKeyword" })
hl("NavicIconsModifier", { link = "StorageClass" })
hl("NavicIconsComment", { link = "CmpItemKindComment" })
hl("NavicIconsString", { link = "CmpItemKindString" })
hl("NavicIconsNumber", { link = "CmpItemKindNumber" })
hl("NavicIconsRegexp", { link = "CmpItemKindStringRegex" })
hl("NavicIconsOperator", { link = "CmpItemKindOperator" })

-- nvim-notify
hl("NotifyERRORBody", { bg = "#222222" })
hl("NotifyERRORBorder", { bg = "#222222" })
hl("NotifyWARNBody", { bg = "#222222" })
hl("NotifyWARNBorder", { bg = "#222222" })
hl("NotifyINFOBody", { bg = "#222222" })
hl("NotifyINFOBorder", { bg = "#222222" })
hl("NotifyDEBUGBody", { bg = "#222222" })
hl("NotifyDEBUGBorder", { bg = "#222222" })
hl("NotifyTRACEBody", { bg = "#222222" })
hl("NotifyTRACEBorder", { bg = "#222222" })

-- headline
hl("Headline1", { bg = "#1E2718" })
hl("Headline2", { bg = "#21262D" })
hl("CodeBlock", { bg = "#1C1C1C" })
hl("Dash", { bg = "#D19A66", bold = true })
