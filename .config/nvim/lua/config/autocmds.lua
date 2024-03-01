-- Clear jumplist on new session
vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "clearjumps" })

-- Disable number column on terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "setlocal nonumber norelativenumber" })

-- Filetype-specific
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
