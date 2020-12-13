
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
gl.joinspaces = false
vim.api.nvim_command('set breakindentopt=shift:2,min:40,sbr')

gl.lbr = true
gl.updatetime = 300

buf.shiftwidth = 2
buf.softtabstop = 2
buf.tabstop = 2
-- buf.smarttab = true
buf.expandtab = true

gl.laststatus = 2
win.number = true
win.relativenumber = true
gl.pumheight = 4

win.foldenable = false

vim.api.nvim_command('set formatoptions+=cqrnj')
vim.api.nvim_command('set formatoptions-=ato')

vim.api.nvim_command('set backspace=indent,eol,start')
