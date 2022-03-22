local M = {}

M.setup = function()
  vim.g.asyncrun_open = 6
  vim.g.asyncrun_rootmarks = { ".git", ".root", "Cargo.toml", "package.json", "pubspec.yaml" }
  vim.g.asynctasks_term_pos = "bottom"
  vim.g.asynctasks_term_rows = 6
  vim.g.asynctasks_term_focus = 0
  vim.g.asynctasks_template = "~/.config/nvim/task_template.ini"
end

M.mapping = function()
  require("telescope").load_extension("asynctasks")
  vim.keymap.set("n", "<leader>lt", require("telescope").extensions.asynctasks.all)
end

return M
