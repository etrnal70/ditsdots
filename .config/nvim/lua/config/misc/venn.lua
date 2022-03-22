local M = {}

function M.toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystrokes
    vim.keymap.set("n", "J", "<C-v>j:VBox<CR>", { buffer = 0, silent = true })
    vim.keymap.set("n", "K", "<C-v>k:VBox<CR>", { buffer = 0, silent = true })
    vim.keymap.set("n", "L", "<C-v>l:VBox<CR>", { buffer = 0, silent = true })
    vim.keymap.set("n", "H", "<C-v>h:VBox<CR>", { buffer = 0, silent = true })
    -- draw a box by pressing "f" with visual selection
    vim.keymap.set("v", "f", ":VBox<CR>", { buffer = 0, silent = true })
  else
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    vim.b.venn_enabled = nil
  end
end

return M
