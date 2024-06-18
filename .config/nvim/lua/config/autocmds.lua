-- Clear jumplist on new session
vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "clearjumps" })

-- Disable number column on terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "setlocal nonumber norelativenumber" })

-- Show textwidth marker on filetypes
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.tex", "*.typ" },
  callback = function()
    vim.cmd "setlocal textwidth=80"
    vim.cmd "setlocal colorcolumn=80"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "DressingSelect" },
  callback = function()
    vim.cmd "hi Cursor blend=100"
    vim.cmd "set cursorlineopt=both"
  end,
})

-- Redraw statuscolumn and tabline on diagnostic update
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function(_)
    vim.api.nvim__redraw { flush = true, tabline = true, statuscolumn = true }
  end,
})

-- Redraw statuscolumn on gitsigns update
vim.api.nvim_create_autocmd("User", {
  pattern = "GitSignsUpdate",
  callback = function(_)
    vim.api.nvim__redraw { flush = true, statuscolumn = true }
  end,
})
