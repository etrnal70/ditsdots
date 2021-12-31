local gmap = function(type, lhs, rhs, func)
  vim.api.nvim_set_keymap(type, lhs, rhs, { callback = func, noremap = true, silent = true })
end

gmap("n", "<leader>gs", "<cmd>Git<CR>")
gmap("n", "<leader>gl", "<cmd>Git log<CR>")
gmap("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>")
gmap("n", "<leader>gch", "<cmd>:diffget //2<CR>")
gmap("n", "<leader>gcl", "<cmd>:diffget //3<CR>")
gmap("n", "<leader>gF", "<cmd>Telescope git_files<CR>")
gmap("n", "<leader>gC", "<cmd>Telescope git_commits<CR>")
gmap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>")
