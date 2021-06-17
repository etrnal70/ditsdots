local vim = vim
local opt = vim.opt
local cmd = vim.api.nvim_command

local function add(value, str, sep)
  sep = sep or ","
  str = str or ""
  value = type(value) == "table" and table.concat(value, sep) or value
  return str ~= "" and table.concat({value, str}, sep) or value
end

opt.encoding = 'utf-8'
opt.showmode = true
opt.termguicolors = true  -- Use GUI colors in terminal
opt.background = 'dark'   -- Set background to dark
cmd('syntax on')

opt.hidden = true                -- Hide unloaded buffer
opt.lazyredraw = true            -- Don't redraw easily
opt.ttyfast = true               -- Performance related
opt.clipboard = 'unnamedplus'    -- Enable system-wide clipboard
opt.mouse = 'n'                  -- Mouse only on normal mode
opt.updatetime = 250             -- Editor update time in ms
opt.foldenable = true           -- Prevent folding upon opening file

opt.splitright = true            -- Vertical split always on the right
opt.splitbelow = true            -- Horizontal split always on the bottom
opt.fillchars =
  add {
  "vert:│",
  "fold: ",
  "eob: ",
  "diff:",
  "msgsep:‾",
  "foldopen:▾",
  "foldsep:│",
  "foldclose:▸"
}

opt.list = true
opt.listchars = "tab:  "

opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.joinspaces = true

-- vim.api.nvim_command('set breakindentopt=shift:2,min:40,sbr')
opt.breakindentopt = 'shift:2,min:40,sbr'
opt.lbr = true                   -- Enable line break
opt.wrap = true

opt.list = true -- Invisible chars
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smarttab = true
opt.expandtab = true
opt.signcolumn = 'auto:1'
-- vim.cmd('set shiftwidth=2')
-- vim.cmd('set softtabstop=2')
-- vim.cmd('set tabstop=2')
-- vim.cmd('set expandtab')
-- vim.cmd('set smarttab')
-- vim.cmd('set signcolumn=auto:1')   -- Signcolumn auto and set minimum width of 1

opt.laststatus = 2           -- Always show statusline
opt.number = true           -- Enable number column
opt.relativenumber = true   -- Make number column relative

opt.wildmenu = true          -- Use wildmenu
opt.wildoptions = 'pum'      -- Use popup style for wildmenu
opt.pumheight = 3            -- Set popup height to 3 entry
opt.pumblend = 3             -- Make popup menu translucent

vim.cmd('set formatoptions+=cqrnj')
vim.cmd('set formatoptions-=ato')
opt.swapfile = false         -- Tbh swap file are disturbing af
opt.backup = false           -- Disable backup file
opt.writebackup = false
opt.undofile = false

opt.backspace = 'indent,eol,start'

