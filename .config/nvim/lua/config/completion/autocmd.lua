vim.cmd([[
  augroup CmpMarkdown
    au!
    autocmd FileType md lua require('cmp').setup.buffer({ sources = { { name = 'luasnip' }, { name = 'buffer', keyword_length = 3 }, { name = 'path' } } })
  augroup END
]])

vim.cmd([[
  augroup CmpTex
    au!
    autocmd FileType tex lua require'cmp'.setup.buffer({ sources = { { name = 'luasnip' }, { name = 'nvim_lsp' }, { name = 'latex_symbols' }, { name = 'buffer', keyword_length = 5 } } })
  augroup END
]])

vim.cmd([[
  autocmd FileType toml lua require'cmp'.setup.buffer{ sources = { { name = 'crates' } } }
]])

vim.cmd([[
  autocmd FileType gitcommit lua require'cmp'.setup.buffer{ sources = { { name = 'luasnip', max_item_count = 5 }, { name = 'cmp_git' } } }
]])
