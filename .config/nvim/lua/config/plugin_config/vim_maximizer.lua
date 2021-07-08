local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- #####################################
-- #####      vim-maximizer        #####
-- #####################################
-- Maxiize/minimize active buffer size
vim.g.maximizer_set_default_mapping = 0
vim.g.maximizer_set_mapping_with_bang = 0
gmap("n", "<leader>m", [[<cmd>MaximizerToggle!<CR>]])
gmap("v", "<leader>gv", [[<cmd>MaximizerToggle!<CR>]])
