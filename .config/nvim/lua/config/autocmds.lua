-- Fix 'Cursor' highlight
-- vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
--   pattern = "*",
--   command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
-- })
-- vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
--   pattern = "*",
--   command = "set guicursor=a:block-blinkon0",
-- })

-- Disable number column on terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "setlocal nonumber norelativenumber" })

-- Update statusline on LSP progress update
vim.api.nvim_create_autocmd("User", {
  pattern = { "LspProgressStatusUpdated" },
  callback = function()
    require("lualine").refresh()
  end,
})

-- Filetype-specific
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.tex" },
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
-- TODO This is a universal autocmd. Rethink a better approach hm
-- vim.api.nvim_create_autocmd("BufLeave", {
--   pattern = "*",
--   callback = function()
--     vim.cmd "hi Cursor blend=0"
--     vim.cmd "set cursorlineopt=number"
--   end,
-- })
