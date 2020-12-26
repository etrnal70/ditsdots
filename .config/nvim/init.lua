local vim = vim

vim.g.mapleader = ','

require('init')
require('statusline')
require('keymaps')
require('theme')
require('vsnip')
require('completion_config')
require('telescope_config')
require('lsp_config')
require('treesitter')
require('misc')

local gl = vim.o
local buf = vim.bo
local win = vim.wo

vim.api.nvim_command('set encoding=utf-8')

gl.hidden = true
gl.wildmenu = true
gl.wildoptions = 'pum'
gl.lazyredraw = true
gl.ttyfast = true
gl.clipboard = 'unnamedplus'
gl.mouse = 'n'

buf.autoindent = true
buf.smartindent = true
win.breakindent = true
gl.joinspaces = true
vim.api.nvim_command('set breakindentopt=shift:2,min:40,sbr')

gl.lbr = true
gl.updatetime = 1000

buf.shiftwidth = 2
buf.softtabstop = 2
buf.tabstop = 2
-- buf.smarttab = true
buf.expandtab = true

gl.laststatus = 2
win.number = true
win.relativenumber = true

gl.pumheight = 5

win.foldenable = false

vim.cmd('set formatoptions+=cqrnj')
vim.cmd('set formatoptions-=ato')
vim.cmd('noswapfile')

vim.cmd('set backspace=indent,eol,start')
