require('completion')
require('custom_func')
require('vimtex')

local set = vim.g
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local completion = require('completion')

completion.addCompletionSource('vimtex', require'vimtex'.complete_item)

cmd([[set shortmess+=c]])
-- vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {silent = true, noremap = true, expr = true})
-- map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<Tab>"', {silent = true, noremap = true, expr = true})

cmd[[imap <expr><TAB> v:lua.tab_complete()]]
cmd[[smap <expr><TAB> v:lua.tab_complete()]]
cmd[[imap <expr><S-TAB> v:lua.s_tab_complete()]]
cmd[[smap <expr><S-TAB> v:lua.s_tab_complete()]]
cmd[[imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"]]

set.completion_matching_strategy_list = {'exact','substring'}
set.completion_enable_snippet = 'vim-vsnip'
set.completion_auto_change_source = 1
set.completion_sorting = 'length'
set.completion_trigger_on_delete = 1
set.completion_enable_auto_paren = 1
set.completion_matching_ignore_case = 1
set.completion_matching_smart_case = 1
set.completion_timer_cycle = 200
set.completion_trigger_keyword_length = 2
set.completion_confirm_key = '<CR>'

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
  tex = {
    {complete_items = {'path'}, triggered_only = {'./', '/'}},
    {complete_items = {'snippet','vimtex', 'lsp'}}
  },
  sql = {
    {complete_items = {'vim-dadbod-completion'}}
  },
  comment = {},
}

cmd[[set completeopt=menuone,noinsert,noselect]]
cmd[[autocmd BufEnter * lua require'completion'.on_attach()]]
cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
