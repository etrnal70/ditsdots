vim.api.nvim_command('set termguicolors')
vim.api.nvim_command('colorscheme toast')
vim.o.background = 'dark'

vim.api.nvim_command('highlight Normal guibg=none')
vim.api.nvim_command('highlight NonText guibg=none')
vim.api.nvim_command('highlight SignColumn ctermbg=none guibg=none')
vim.api.nvim_command('highlight VertSplit ctermbg=none guibg=none')

