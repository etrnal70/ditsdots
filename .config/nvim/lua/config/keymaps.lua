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

-- Tab operation
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")
map("n", "<leader>tc", ":tabclose<CR>")

-- Move lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

-- Resize window using Ctrl + Alt + <hjkl>
map("n", "<C-A-k>", ":resize +2<CR>")
map("n", "<C-A-j>", ":resize -2<CR>")
map("n", "<C-A-h>", ":vertical resize +2<CR>")
map("n", "<C-A-l>", ":vertical resize -2<CR>")

-- Move one character left or right in insert mode
map("i", "<C-l>", "<esc>la")
map("i", "<C-h>", "<esc>i")

map(
  "i",
  "<C-r>",
  "<C-r><C-o>",
  { noremap = true, desc = "Insert contents of named register. Inserts text literally, not as if you typed it." }
)

-- Terminal
map("t", "<esc>", "<C-\\><C-n>")

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_next)
map("n", "]d", vim.diagnostic.goto_prev)
map("n", "<leader>lq", require("telescope.builtin").diagnostics)

-- Git-related
map("n", "<leader>gg", ":Git<CR>")
map("n", "<leader>gl", ":Git log<CR>")
map("n", "<leader>gL", ":Flogsplit<CR>")
map("n", "<leader>gp", ":Git! push<CR>")
map("n", "<leader>gP", require("config.git.commands").async_gpull)
map("n", "<leader>gf", ":Git! fetch<CR>")
map("n", "<leader>gd", ":tabedit % | Gvdiffsplit!<CR>")
map("n", "<leader>gch", ":diffget //2<CR>")
map("n", "<leader>gcl", ":diffget //3<CR>")
map("n", "<leader>lF", require("telescope.builtin").git_files)
map("n", "<leader>gC", require("telescope.builtin").git_commits)
map("n", "<leader>gb", require("telescope.builtin").git_branches)

-- neotest
map("n", "ta", function()
  require("neotest").run.attach()
end)
map("n", "tn", function()
  require("neotest").run.run()
end)
map("n", "tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end)
map("n", "tl", function()
  require("neotest").run.run_last()
end)
map("n", "td", function()
  require("neotest").run.run({ strategy = "dap" })
end)
map("n", "to", function()
  require("neotest").output.open({ enter = true })
end)
map("n", "ts", function()
  require("neotest").run.stop()
end)
map("n", "tt", function()
  require("neotest").summary.toggle()
end)

-- File tree
map("n", "<leader>st", ":Neotree toggle<CR>")

-- symbols-outline
map("n", "<leader>ss", ":SymbolsOutline<CR>")

-- Telescope
map("n", "<leader>lc", require("telescope.builtin").commands)
map("n", "<leader>lf", require("telescope.builtin").find_files)
map("n", "<leader>ls", require("telescope.builtin").live_grep)
map("n", "<leader>lb", require("telescope.builtin").buffers)
map("n", "<leader>lo", require("telescope.builtin").oldfiles)
map("n", "<leader>lH", require("telescope.builtin").help_tags)

-- overseer
map("n", "<leader>ot", ":OverseerToggle!<CR>")
map("n", "<leader>or", ":OverseerRun<CR>")

-- ssr.nvim
map({ "n", "x" }, "<leader>Sr", function()
  require("ssr").open()
end)

-- neogen
map("n", "<leader>dg", require("neogen").generate)

-- rest.nvim
map("n", "<leader>rr", "<Plug>RestNvim")
map("n", "<leader>rp", "<Plug>RestNvimPreview")
