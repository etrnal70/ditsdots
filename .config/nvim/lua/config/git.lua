local map = function(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

map("n", "<leader>gs", "<cmd>Git<CR>")
map("n", "<leader>gl", "<cmd>Git log<CR>")
map("n", "<leader>gp", "<cmd>Git push<CR>")
map("n", "<leader>gP", "<cmd>Git pull<CR>")
map("n", "<leader>gd", "<cmd>tabnew | Gvdiffsplit!<CR>")
map("n", "<leader>gch", "<cmd>diffget //2<CR>")
map("n", "<leader>gcl", "<cmd>diffget //3<CR>")
map("n", "<leader>gC", require("telescope.builtin").git_commits)
map("n", "<leader>gb", require("telescope.builtin").git_branches)
