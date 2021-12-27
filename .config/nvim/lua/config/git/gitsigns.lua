require("gitsigns").setup({
  signs = {
    add = { hl = "DiffAdd", text = "│" },
    change = { hl = "DiffChange", text = "│" },
    delete = { hl = "DiffDelete", text = "│" },
    topdelete = { hl = "DiffDelete", text = "│" },
    changedelete = { hl = "DiffChange", text = "│" },
  },
  keymaps = {
    noremap = true,
    buffer = true,
    ["n <leader>hs"] = "<cmd>Gitsigns stage_hunk<CR>",
    ["v <leader>hs"] = ":Gitsigns stage_hunk<CR>",
    ["n <leader>hS"] = "<cmd>Gitsigns stage_buffer<CR>",
    ["n <leader>hU"] = "<cmd>Gitsigns reset_buffer_index<CR>",
    ["n <leader>hu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
    ["n <leader>hr"] = "<cmd>Gitsigns reset_hunk<CR>",
    ["v <leader>hr"] = ":Gitsigns reset_hunk<CR>",
    ["n <leader>hR"] = "<cmd>Gitsigns reset_buffer<CR>",
    ["n <leader>hb"] = "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>",
    ["n <leader>hp"] = "<cmd>Gitsigns preview_hunk<CR>",

    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
  },
  preview_config = {
    border = "solid",
  },
  current_line_blame = true,
  status_formatter = nil,
  word_diff = true,
})
