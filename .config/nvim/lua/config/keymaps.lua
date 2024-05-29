local map = function(mode, l, r, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, l, r, opts)
end

-- Resize window using Ctrl + Alt + <hjkl>
-- if vim.fn.has "mac" == 1 then
--   map("n", "<C->", ":resize +2<CR>")
--   map("n", "<C-Ô>", ":resize -2<CR>")
--   map("n", "<C-Ó>", ":vertical resize +2<CR>")
--   map("n", "<C-Ò>", ":vertical resize -2<CR>")
-- else
map("n", "<C-A-k>", ":resize +2<CR>")
map("n", "<C-A-j>", ":resize -2<CR>")
map("n", "<C-A-h>", ":vertical resize +2<CR>")
map("n", "<C-A-l>", ":vertical resize -2<CR>")
-- end

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

-- Search in range
map("x", "/", "<Esc>/\\%V")

-- Move one character left or right in insert mode
map("i", "<C-l>", "<Right>")
map("i", "<C-h>", "<Left>")

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
map("n", "[d", function()
  vim.diagnostic.jump { count = 1 }
end)
map("n", "]d", function()
  vim.diagnostic.jump { count = -1 }
end)

-- Git-related
map("n", "<leader>gL", ":Flogsplit<CR>")
map("n", "<leader>gd", ":tabedit % | Gvdiffsplit!<CR>")
map("n", "<leader>gch", ":diffget //2<CR>")
map("n", "<leader>gcl", ":diffget //3<CR>")

map("n", "[c", function()
  require("treesitter-context").go_to_context()
end)

-- symbols-outline
map("n", "<leader>ss", ":Outline<CR>")
