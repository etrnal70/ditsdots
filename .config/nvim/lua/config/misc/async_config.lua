local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

vim.g.asyncrun_open = 6
vim.g.asynctasks_term_rows = 6
vim.g.asynctasks_template = "~/.config/nvim/task_template.ini"

gmap("n", "<leader>Ar", "<cmd>AsyncTask file-run")
gmap("n", "<leader>Ab", "<cmd>AsyncTask file-build")
gmap("n", "<leader>At", "<cmd>AsyncTask file-test")
