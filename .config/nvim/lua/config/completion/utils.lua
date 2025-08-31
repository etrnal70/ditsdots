local M = {}

local kinds = require("blink.cmp.types").CompletionItemKind

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

M.allow_append_space = function(entry_kind)
  for _, val in ipairs(allow_list) do
    if entry_kind == val then
      return true
    end
  end

  return false
end

M.append_space = function(item)
  return function(e)
    local ts_utils = require "nvim-treesitter.ts_utils"
    local node = ts_utils.get_node_at_cursor(0)

    -- Check if there are any char after cursor
    -- local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- if vim.api.nvim_buf_get_lines(0, line, line + 1, true)[1]:sub(col, col):match("%s") ~= nil then
    --   return
    -- end

    local prohibited_node = {
      "argument_list",
      "parameter_list",
      "keyed_element",
    }

    -- Check treesitter node
    if node and node:parent() and not vim.tbl_contains(prohibited_node, node:parent():type()) then
      if vim.tbl_contains(M.allow_list, item.kind) then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Space>", true, true, true), "", true)
      end
    end
  end
end

M.has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match "%s" == nil
end

M.concat_str = function(str)
  if string.len(str) > 35 then
    return string.sub(str, 1, 20) .. "..." .. string.sub(str, -12)
  end
  return str
end

return M
