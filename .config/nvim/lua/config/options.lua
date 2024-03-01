local opt = vim.opt

opt.termguicolors = true -- Use GUI colors in terminal
opt.hidden = true -- Hide unloaded buffer
opt.lazyredraw = false
opt.clipboard = { "unnamedplus" } -- Enable system-wide clipboard
opt.mouse = "n" -- Mouse only on normal mode
opt.updatetime = 100
opt.ttimeoutlen = 0
opt.showtabline = 2
opt.laststatus = 3
opt.diffopt:append { "algorithm:histogram", "indent-heuristic", "linematch:60" }

opt.cmdheight = 0
opt.autoread = false

opt.foldlevel = 99 -- Open folds when opening file
opt.foldlevelstart = 99
opt.foldenable = true -- Prevent folding upon opening file
opt.foldcolumn = "0"

opt.splitright = true -- Vertical split always on the right
opt.splitbelow = true -- Horizontal split always on the bottom
opt.splitkeep = "screen"

opt.smoothscroll = true
opt.conceallevel = 2
opt.fillchars = {
  vert = "│",
  fold = " ",
  eob = " ",
  diff = "╱",
  msgsep = "‾",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
}

opt.list = true -- Invisible chars
opt.listchars = {
  eol = " ",
  tab = "  ",
  extends = "›",
  precedes = "‹",
  trail = "•",
}

opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.joinspaces = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.signcolumn = "auto:1-2"

opt.pumheight = 4

opt.wildignorecase = true
opt.wildignore = {
  ".pdf",
  ".zip",
  ".tar.xz",
  ".rar",
  ".o",
  ".out",
  ".toc",
  ".aux",
  ".lock",
  ".png",
  ".gif",
  ".jpg",
}

opt.shortmess = {
  t = true,
  A = true,
  o = true,
  O = true,
  T = true,
  f = true,
  F = true,
  s = true,
  W = true,
  c = true,
  I = true,
}

opt.smartindent = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = {
  shift = 0,
  min = 40,
  sbr = true,
}
opt.formatoptions = {
  ["1"] = true,
  ["2"] = true,
  q = true,
  p = true,
  c = true,
  r = true,
  n = true,
  t = true,
  j = true,
  l = false,
  v = true,
  w = true,
}

opt.swapfile = false
opt.writebackup = false
opt.autowriteall = true
opt.emoji = false

vim.g.tex_flavor = "latex"

-- Default Diagnostics Override
vim.diagnostic.config {
  float = {
    border = "solid",
    source = "always",
  },
  -- signs = {
  --   severity = { min = vim.diagnostic.severity.WARN },
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = "",
  --     [vim.diagnostic.severity.WARN] = "",
  --     [vim.diagnostic.severity.INFO] = "",
  --     [vim.diagnostic.severity.HINT] = "",
  --   },
  --   numhl = {
  --     [vim.diagnostic.severity.ERROR] = "DiagnosticError",
  --     [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
  --     [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
  --     [vim.diagnostic.severity.HINT] = "DiagnosticHint",
  --   },
  -- },
  signs = false,
  severity_sort = true,
  underline = true,
  update_in_insert = true,
  virtual_text = {
    format = function(diag)
      if #diag > 1 then
        return diag.message
      end

      if string.len(diag.message) > 35 then
        return string.sub(diag.message, 1, 35) .. "..."
      end
      return diag.message
    end,
    severity = { min = vim.diagnostic.severity.WARN },
  },
}
