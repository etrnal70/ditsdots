local M = {}

M.border = {
  "▂", -- Bottom
  "▂", -- Bottom
  "▂", -- Bottom
  "█", -- Full
  "🮂", -- Top
  "🮂", -- Top
  "🮂", -- Top
  "█", -- Full
}

M.generate_line = function()
  local res = ""
  for _ = 1, vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()) do
    res = res .. "─"
  end
  return res
end

return M
