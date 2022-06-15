local M = {}

M.generate_line = function()
  -- local res = ""
  -- for _ = 1, vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()) do
  --   res = res .. "─"
  -- end
  -- return res
  return string.rep("─", vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()))
end

M.gps = function()
  if not require("nvim-gps").is_available() then
    return ""
  end
  return "  " .. require("nvim-gps").get_location()
end

return M
