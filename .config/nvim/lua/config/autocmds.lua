-- Fix 'Cursor' highlight
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  pattern = "*",
  command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
})
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  pattern = "*",
  command = "set guicursor=a:block-blinkon0",
})

-- Disable statusline on command
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "*",
  callback = function()
    vim.opt.laststatus = 0
    vim.opt.statusline = "%{%v:lua.require'config.utils'.generate_line()%}"
    vim.cmd("hi StatusLine guifg=#2F2F2F guibg=NONE")
    vim.cmd("redraws")
  end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("hi StatusLine guifg=NONE guibg=#1F1F1F")
    vim.opt.laststatus = 3
    require("config.misc.feline").setup()
  end,
})

-- Disable number column on terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "setlocal nonumber norelativenumber" })
