local vim = vim

vim.g.mapleader = ' '

require('init')
require('theme')
require('lsp_config')
require('git_config')
require('misc')

local function add(value, str, sep)
  sep = sep or ","
  str = str or ""
  value = type(value) == "table" and table.concat(value, sep) or value
  return str ~= "" and table.concat({value, str}, sep) or value
end

-- TODO : Wait for upstream fix for vim.o
local gl = vim.o
local buf = vim.bo
local win = vim.wo

-- vim.api.nvim_command('set encoding=utf-8')
gl.encoding = 'utf-8'
gl.showmode = true

gl.hidden = true                -- Hide unloaded buffer
gl.lazyredraw = true            -- Don't redraw easily
gl.ttyfast = true               -- Performance related
gl.clipboard = 'unnamedplus'    -- Enable system-wide clipboard
gl.mouse = 'n'                  -- Mouse only on normal mode
gl.updatetime = 250             -- Editor update time in ms
win.foldenable = true           -- Prevent folding upon opening file
-- vim.cmd('set foldenable')

gl.splitright = true            -- Vertical split always on the right
gl.splitbelow = true            -- Horizontal split always on the bottom
gl.fillchars =
  add {
  "vert:▕",
  "fold: ",
  "eob: ",
  "diff:",
  "msgsep:‾",
  "foldopen:▾",
  "foldsep:│",
  "foldclose:▸"
}

gl.list = true
gl.listchars = "tab:  "

buf.autoindent = true
buf.smartindent = true
win.breakindent = true
gl.joinspaces = true

-- vim.api.nvim_command('set breakindentopt=shift:2,min:40,sbr')
gl.breakindentopt = 'shift:2,min:40,sbr'
gl.lbr = true                   -- Enable line break
gl.wrap = true

gl.list = true -- Invisible chars
-- buf.shiftwidth = 4
-- buf.softtabstop = 4
-- buf.tabstop = 4
-- gl.smarttab = true
-- gl.expandtab = true
-- win.signcolumn = 'auto:1'
vim.cmd('set shiftwidth=2')
vim.cmd('set softtabstop=2')
vim.cmd('set tabstop=2')
vim.cmd('set expandtab')
vim.cmd('set smarttab')
vim.cmd('set signcolumn=auto:1')   -- Signcolumn auto and set minimum width of 1

gl.laststatus = 2           -- Always show statusline
win.number = true           -- Enable number column
win.relativenumber = true   -- Make number column relative

gl.wildmenu = true          -- Use wildmenu
gl.wildoptions = 'pum'      -- Use popup style for wildmenu
gl.pumheight = 4            -- Set popup height to 4 entry
gl.pumblend = 3             -- Make popup menu translucent

vim.cmd('set formatoptions+=cqrnj')
vim.cmd('set formatoptions-=ato')
gl.swapfile = false         -- Tbh swap file are disturbing af
gl.backup = false           -- Disable backup file
gl.writebackup = false
buf.undofile = false

-- vim.cmd('set backspace=indent,eol,start')   -- For good backspace
gl.backspace = 'indent,eol,start'

