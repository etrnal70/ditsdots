local cmd = vim.api.nvim_command

local map = function(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

-- Switch active buffer with s + <hjkl>
map("", "sh", "<C-w>h")
map("", "sk", "<C-w>k")
map("", "sj", "<C-w>j")
map("", "sl", "<C-w>l")

-- Move tab
map("n", "<leader>bn", "<cmd>tabn<CR>")
map("n", "<leader>bp", "<cmd>tabp<CR>")

-- Move lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

-- Resize window using Ctrl + Alt + <hjkl>
map("n", "<C-A-k>", "<cmd>resize +2<CR>")
map("n", "<C-A-j>", "<cmd>resize -2<CR>")
map("n", "<C-A-h>", "<cmd>vertical resize +2<CR>")
map("n", "<C-A-l>", "<cmd>vertical resize -2<CR>")

-- Move one character left or right in insert mode
-- using Alt + <hl>
map("i", "<A-l>", "<esc>la")
map("i", "<A-h>", "<esc>i")

-- Terminal
map("t", "<esc>", "<C-\\><C-n>")

-- Neovim Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_prev)
map("n", "<leader>lq", require("telescope.builtin").diagnostics)

-- nvim-tree.lua
map("n", "<leader>st", "<cmd>NvimTreeToggle<CR>")

-- Telescope
map("n", "<leader>lf", require("config.telescope").project_files)
map("n", "<leader>ls", require("telescope.builtin").live_grep)
map("n", "<leader>lb", require("telescope.builtin").buffers)
map("n", "<leader>lo", require("telescope.builtin").oldfiles)
map("n", "<leader>lH", require("telescope.builtin").help_tags)

-- neogen
map("n", "<leader>dg", require("neogen").generate)

-- rest.nvim
map("n", "<leader>rr", "<Plug>RestNvim")
map("n", "<leader>rp", "<Plug>RestNvimPreview")

-- autocmd
cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
