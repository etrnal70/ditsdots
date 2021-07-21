local cmd = vim.cmd

local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- #####################################
-- #####         Keymapping        #####
-- #####################################
-- Switch active buffer with Ctrl + w + <hjkl>
cmd([[map sh <C-w>h]])
cmd([[map sk <C-w>k]])
cmd([[map sj <C-w>j]])
cmd([[map sl <C-w>l]])

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

-- Goto file in vertical split
-- TODO: function to determine split based on window
-- width
cmd("nnoremap <Leader><Leader>gf <C-w>vgf")
cmd("nnoremap <Leader><Leader>gF <C-w>vgF")

-- vim-maximizer
gmap("n", "<leader>m", [[<cmd>MaximizerToggle!<CR>]])
gmap("v", "<leader>gv", [[<cmd>MaximizerToggle!<CR>]])

-- Telescope
gmap("n", "<leader>lf", "<cmd>Telescope find_files<CR>")
gmap("n", "<leader>ls", "<cmd>Telescope live_grep<CR>")
gmap("n", "<leader>lb", "<cmd>Telescope buffers<CR>")
gmap("n", "<leader>lt", "<cmd>Telescope treesitter<CR>")
gmap("n", "<leader>lo", "<cmd>Telescope oldfiles<CR>")
gmap("n", "<leader>lH", "<cmd>Telescope help_tags<CR>")
gmap("n", "<leader>lh", "<cmd>Telescope heading<CR>") -- Need autocmd
gmap("n", "<leader>gF", "<cmd>Telescope git_files<CR>")
gmap("n", "<leader>gC", "<cmd>Telescope git_commits<CR>")

-- TODO: some autocmd's here
