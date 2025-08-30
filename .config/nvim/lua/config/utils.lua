local M = {}

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

M.keymap = function(bufnr, mode, l, r, opts)
  opts = opts or {}
  if bufnr ~= nil then
    opts.buffer = bufnr
  end
  vim.keymap.set(mode, l, r, opts)
end

M.get_current_filepath = function()
  local filepath = vim.fn.expand "%:p"
  vim.fn.setreg("+", '"' .. filepath .. '"')
end

return M
