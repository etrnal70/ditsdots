local M = {}

-- local context = require("cmp.config.context")
local kinds = require("cmp.types.lsp").CompletionItemKind

M.item_kinds = {
  Text = " Text",
  Method = " Method",
  Function = "ƒ Function",
  Constructor = " Constructor",
  Field = "識Field",
  Variable = " Variable",
  Class = " Class",
  Interface = "ﰮ Interface",
  Module = " Module",
  Property = " Property",
  Unit = " Unit",
  Value = " Value",
  Enum = "了Enum",
  Keyword = " Keyword",
  Snippet = " Snippet",
  Color = " Color",
  File = " File",
  Reference = "渚Reference",
  Folder = " Folder",
  Constant = " Constant",
  Struct = " Struct",
  Event = "鬒Event",
  Operator = "\u{03a8} Operator",
  TypeParameter = "ﰠ TypeParameter",
}

M.allow_append_space = function(entry_kind)
  local allow_list = {
    kinds.Constant,
    kinds.Enum,
    kinds.EnumMember,
    kinds.Field,
    kinds.Keyword,
    kinds.Operator,
    kinds.Text,
    kinds.Unit,
    kinds.Variable,
    kinds.Value,
  }

  for _, val in ipairs(allow_list) do
    if entry_kind == val then
      return true
    end
  end

  return false
end

M.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.concat_str = function(str)
  if string.len(str) > 35 then
    return string.sub(str, 1, 20) .. "..." .. string.sub(str, -12)
  end
  return str
end

return M
