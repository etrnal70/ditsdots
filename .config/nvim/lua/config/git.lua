local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

gmap("n", "<leader>gs", "<cmd>:Git<CR>")
gmap("n", "<leader>gl", "<cmd>:Git log<CR>")
gmap("n", "<leader>gch", "<cmd>:diffget //2<CR>")
gmap("n", "<leader>gcl", "<cmd>:diffget //3<CR>")
gmap("n", "<leader>gF", "<cmd>Telescope git_files<CR>")
gmap("n", "<leader>gC", "<cmd>Telescope git_commits<CR>")
gmap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>")

-- TODO: Test this
vim.cmd(
  "command! -bang -bar -nargs=* Gpush execute 'AsyncRun -cwd=' . fnameescape(FugitiveGitDir()) 'git push' <q-args>"
)
vim.cmd(
  "command! -bang -bar -nargs=* Gfetch execute 'AsyncRun -cwd=' . fnameescape(FugitiveGitDir()) 'git fetch' <q-args>"
)
