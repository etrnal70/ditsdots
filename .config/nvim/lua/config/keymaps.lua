local cmd = vim.api.nvim_command

local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- Switch active buffer with s + <hjkl>
gmap("", "sh", "<C-w>h")
gmap("", "sk", "<C-w>k")
gmap("", "sj", "<C-w>j")
gmap("", "sl", "<C-w>l")

-- Move tab
gmap("n", "<leader>bn", "<cmd>tabn<CR>")
gmap("n", "<leader>bp", "cmd>tabp<CR>")

-- Move lines up and down
gmap("v", "J", ":m '>+1<CR>gv=gv")
gmap("v", "K", ":m '>-2<CR>gv=gv")

-- Resize window using Ctrl + Alt + <hjkl>
gmap("n", "<C-A-k>", "<cmd>resize +2<CR>")
gmap("n", "<C-A-j>", "<cmd>resize -2<CR>")
gmap("n", "<C-A-h>", "<cmd>vertical resize +2<CR>")
gmap("n", "<C-A-l>", "<cmd>vertical resize -2<CR>")

-- Move one character left or right in insert mode
-- using Alt + <hl>
gmap("i", "<A-l>", "<esc>la")
gmap("i", "<A-h>", "<esc>i")

-- Terminal
gmap("t", "<esc>", "<C-\\><C-n>")

-- Neovim Diagnostics
gmap("n", "<leader>e", "<cmd>lua vim.diagnostic.show_line_diagnostics({source='always'})<CR>")

-- nvim-tree.lua
gmap("n", "<leader>st", "<cmd>NvimTreeToggle<CR>")

-- Telescope
gmap("n", "<leader>lf", "<cmd>Telescope find_files<CR>")
gmap("n", "<leader>ls", "<cmd>Telescope live_grep<CR>")
gmap("n", "<leader>lb", "<cmd>Telescope buffers<CR>")
gmap("n", "<leader>lt", "<cmd>lua require'telescope'.extensions.asynctasks.all()<CR>")
gmap("n", "<leader>lo", "<cmd>Telescope oldfiles<CR>")
gmap("n", "<leader>lH", "<cmd>Telescope help_tags<CR>")
gmap("n", "<leader>lh", "<cmd>Telescope heading<CR>")

-- nvim-bufferline
gmap("n", "bd", "<cmd>bdelete! %<CR>")
gmap("n", "bc", "<cmd>BufferLinePickClose<CR>")
gmap("n", "bn", "<cmd>BufferLineCycleNext<CR>")
gmap("n", "bp", "<cmd>BufferLineCyclePrev<CR>")

-- neogen
gmap("n", "<leader>dg", "<cmd>lua require'neogen'.generate()<CR>")

-- rest.nvim
cmd("nmap <leader>rr <Plug>RestNvim")
cmd("nmap <leader>rp <Plug>RestNvimPreview")
