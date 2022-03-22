local map = function(mode, l, r, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, l, r, opts)
end

-- Switch active buffer with s + <hjkl>
map("", "sh", "<C-w>h")
map("", "sk", "<C-w>k")
map("", "sj", "<C-w>j")
map("", "sl", "<C-w>l")

-- Move tab
map("n", "<leader>bn", ":tabn<CR>")
map("n", "<leader>bp", ":tabp<CR>")

-- Move lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

-- Resize window using Ctrl + Alt + <hjkl>
map("n", "<C-A-k>", ":resize +2<CR>")
map("n", "<C-A-j>", ":resize -2<CR>")
map("n", "<C-A-h>", ":vertical resize +2<CR>")
map("n", "<C-A-l>", ":vertical resize -2<CR>")

-- Move one character left or right in insert mode
-- using Alt + <hl>
map("i", "<A-l>", "<esc>la")
map("i", "<A-h>", "<esc>i")

-- Terminal
map("t", "<esc>", "<C-\\><C-n>")

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_prev)
map("n", "<leader>lq", require("telescope.builtin").diagnostics)

-- Git-related
map("n", "<leader>gg", ":Git<CR>")
map("n", "<leader>gl", ":Git log<CR>")
map("n", "<leader>gL", ":Flogsplit<CR>")
map("n", "<leader>gp", require("config.git.commands").async_gpush)
map("n", "<leader>gP", require("config.git.commands").async_gpull)
map("n", "<leader>gf", require("config.git.commands").async_gfetch)
map("n", "<leader>gd", ":Gvdiffsplit!<CR>")
map("n", "<leader>gch", ":diffget //2<CR>")
map("n", "<leader>gcl", ":diffget //3<CR>")
map("n", "<leader>lF", require("telescope.builtin").git_files)
map("n", "<leader>gC", require("telescope.builtin").git_commits)
map("n", "<leader>gb", require("telescope.builtin").git_branches)

-- vim-ultest
map("n", "<leader>ta", ":UltestAttach<CR>")
map("n", "<leader>tn", ":UltestNearest<CR>")
map("n", "<leader>tf", ":Ultest<CR>")
map("n", "<leader>tl", ":UltestLast<CR>")
map("n", "<leader>td", ":UltestDebug<CR>")
map("n", "<leader>to", ":UltestOutput<CR>")
map("n", "<leader>ts", ":UltestStop<CR>")
map("n", "<leader>tt", ":UltestSummary<CR>")
map("n", "<leader>tc", ":UltestClear<CR>")

-- nvim-tree.lua
map("n", "<leader>st", ":NvimTreeToggle<CR>")

-- Telescope
map("n", "<leader>lf", require("telescope.builtin").find_files)
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
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "setlocal nonumber norelativenumber" })
