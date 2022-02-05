local map = function(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

vim.g.asyncrun_open = 6
vim.g.asyncrun_rootmarks = { ".git", ".root", "Cargo.toml", "package.json", "pubspec.yaml" }
vim.g.asynctasks_term_pos = "bottom"
vim.g.asynctasks_term_rows = 6
vim.g.asynctasks_term_focus = 0
vim.g.asynctasks_template = "~/.config/nvim/task_template.ini"

map("n", "<leader>jr", "<cmd>AsyncTask project-run<CR>")
map("n", "<leader>jb", "<cmd>AsyncTask project-build<CR>")
