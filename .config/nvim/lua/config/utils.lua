local M = {}

M.generate_line = function()
  return string.rep("─", vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()))
end

M.gps = function()
  if not require("nvim-gps").is_available() then
    return ""
  end
  return "  " .. require("nvim-gps").get_location()
end

M.transparent_border = {
  { "╭", "Normal" },
  { "─", "Normal" },
  { "╮", "Normal" },
  { "│", "Normal" },
  { "╯", "Normal" },
  { "─", "Normal" },
  { "╰", "Normal" },
  { "│", "Normal" },
}

return M
