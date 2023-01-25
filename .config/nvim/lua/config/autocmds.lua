-- LSP
-- vim.api.nvim_create_augroup("LspFuncs", {})
-- vim.api.nvim_create_autocmd("LspAttach", {})
-- vim.api.nvim_create_autocmd("LspDetach", {
--   group = "LspFuncs",
-- })

-- Fix 'Cursor' highlight
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  pattern = "*",
  command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
})
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  pattern = "*",
  command = "set guicursor=a:block-blinkon0",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "^Outline$",
  callback = function()
    vim.cmd("set cursorlineopt=both")
    vim.cmd("hi Cursor blend=100")
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = "^Outline$",
  callback = function()
    vim.cmd("hi Cursor blend=0")
    vim.cmd("set cursorlineopt=number")
  end,
})

-- Inlay hints
-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = "LspAttach_inlayhints",
--   callback = function(args)
--     if not (args.data and args.data.client_id) then
--       return
--     end
--
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     require("lsp-inlayhints").on_attach(client, bufnr)
--   end,
-- })

-- Disable statusline on command
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--   pattern = "*",
--   callback = function()
--     vim.opt.laststatus = 0
--     vim.opt.statusline = "%{%v:lua.require'config.utils'.generate_line()%}"
--     vim.cmd("hi StatusLine guifg=#1F1F1F guibg=NONE")
--     vim.cmd("redraws")
--   end,
-- })
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("hi StatusLine guifg=NONE guibg=#1F1F1F")
--     vim.cmd("set inccommand=nosplit")
--     vim.cmd("redraws")
--     vim.opt.laststatus = 3
--     require("config.misc.feline").setup()
--   end,
-- })

-- Disable number column on terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "setlocal nonumber norelativenumber" })
