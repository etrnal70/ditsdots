local cmd = vim.cmd

local gmap = function(type, key, value)
	vim.api.nvim_set_keymap(type,key,value,{noremap = true, silent = true});
end

-- #####################################
-- #####         Keymapping        #####
-- #####################################
-- Switch active buffer with Ctrl + w + <hjkl>
cmd[[map sh <C-w>h]]
cmd[[map sk <C-w>k]]
cmd[[map sj <C-w>j]]
cmd[[map sl <C-w>l]]

-- Move tab
gmap('n','<leader>bn',[[<cmd>tabn<CR>]])
gmap('n','<leader>bp',[[<cmd>tabp<CR>]])

-- Resize window using Ctrl + Alt + <hjkl>
gmap('n','<C-A-k>',[[<cmd>resize +2<CR>]])
gmap('n','<C-A-j>',[[<cmd>resize -2<CR>]])
gmap('n','<C-A-h>',[[<cmd>vertical resize +2<CR>]])
gmap('n','<C-A-l>',[[<cmd>vertical resize -2<CR>]])

-- Move one character left or right in insert mode
-- using Alt + <hl>
gmap('i','<A-l>',[[<esc>la]])
gmap('i','<A-h>',[[<esc>i]])

-- Goto file in vertical split
-- TODO: function to determine split based on window
-- width
cmd[[nnoremap <Leader><Leader>gf <C-w>vgf ]]
cmd[[nnoremap <Leader><Leader>gF <C-w>vgF ]]

-- Telescope
gmap('n','<leader>lf',[[<cmd>lua require'telescope.builtin'.find_files({})<CR>]])
gmap('n','<leader>ls',[[<cmd>lua require'telescope.builtin'.live_grep({})<CR>]])
gmap('n','<leader>lb',[[<cmd>lua require'telescope.builtin'.buffers({initial_mode = "normal"})<CR>]])
gmap('n','<leader>lt',[[<cmd>lua require'telescope.builtin'.treesitter({})<CR>]])
gmap('n','<leader>lc',[[<cmd>lua require'telescope.builtin'.tags({})<CR>]])
gmap('n','<leader>lq',[[<cmd>lua require'config.telescope'.lsp_workspace_diagnostic_ivy()<CR>]])
gmap('n','<leader>lo',[[<cmd>lua require'telescope.builtin'.oldfiles({})<CR>]])
gmap('n','<leader>lh',[[<cmd>lua require'telescope.builtin'.help_tags({})<CR>]])
gmap('n','<leader>lgf',[[<cmd>lua require'telescope.builtin'.git_files({})<CR>]])
gmap('n','<leader>lgc',[[<cmd>lua require'telescope.builtin'.git_commits({})<CR>]])
gmap('n','<leader>lmk',[[<cmd>lua require'telescope.builtin'.marks({})<CR>]])

