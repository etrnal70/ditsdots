local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").gopls.setup({
    on_attach = function(client, bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      require("go").setup({
        gofmt = "gofumpt",
        tag_transform = true,
        test_template = "",
        test_template_dir = "",
        comment_placeholder = "",
        lsp_on_attach = false,
        lsp_document_formatting = false,
        dap_debug_keymap = false,
        dap_debug_vt = false,
      })
      on_attach(client, bufnr)
      map("n", "<leader>Gd", "<cmd>GoCmt<CR>")
      map("n", "<leader>Gl", "<cmd>GoLint<CR>")
      map("n", "<leader>Gta", "<cmd>GoAddTag<CR>")
      map("n", "<leader>Gtr", "<cmd>GoRmTag<CR>")
      map("n", "<leader>Gtc", "<cmd>GoClearTag<CR>")
      map("n", "<leader>Gfs", "<cmd>GoFillStruct<CR>")
      map("n", "<leader>Grt", "<cmd>GoRmTag<CR>")
    end,
    capabilities = capabilities,
  })
end

return M
