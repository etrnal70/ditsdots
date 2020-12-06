require('completion')
require('custom_func')

local map = vim.api.nvim_set_keymap

vim.cmd([[set shortmess+=c]])
-- vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {silent = true, noremap = true, expr = true})
-- map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<Tab>"', {silent = true, noremap = true, expr = true})

vim.cmd[[imap <expr><TAB> v:lua.tab_complete()]]
vim.cmd[[smap <expr><TAB> v:lua.tab_complete()]]
vim.cmd[[imap <expr><S-TAB> v:lua.s_tab_complete()]]
vim.cmd[[smap <expr><S-TAB> v:lua.s_tab_complete()]]
vim.cmd[[imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"]]

vim.g.completion_matching_strategy_list = {'exact','substring','fuzzy'}
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_auto_change_source = 1
vim.g.completion_sorting = 'none'
vim.g.completion_trigger_on_delete = 1
vim.g.completion_matching_ignore_case = 1
vim.g.completion_matching_smart_case = 1
vim.g.completion_timer_cycle = 500
vim.g.completion_trigger_keyword_length = 1
vim.g.completion_confirm_key = '<CR>'

vim.g.completion_trigger_character = {'::','.'}

vim.g.completion_chain_complete_list = {
  default = {
    {complete_items = {'snippet', 'lsp'}},
    {complete_items = {'path'}, triggered_only = {'./', '/'}},
    {complete_items = {'buffers'}},
  },
  string = {
    {complete_items = {'path'}, triggered_only = {'./', '/'}},
    {complete_items = {'buffers'}},
  },
  comment = {},
}

vim.cmd[[set completeopt=menuone,noinsert,noselect]]
vim.cmd[[autocmd BufEnter * lua require'completion'.on_attach()]]
vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
