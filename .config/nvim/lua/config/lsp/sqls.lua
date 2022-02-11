local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").sqls.setup({
    cmd = { "sqls", "-config", vim.fn.getcwd() .. "/config.yml" },
    on_attach = function(client, bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      require("sqls").on_attach(client, bufnr)
      on_attach(client, bufnr)
      -- Keymaps
      map({ "n", "v" }, "<leader>Sqe", "<Plug>(sqls-query-execute)")
      map({ "n", "v" }, "<leader>Sqv", "<Plug>(sqls-query-execute-vertical)")
      map("n", "<leader>Sd", ":SqlsShowDatabases<CR>")
      map("n", "<leader>SD", ":SqlsSwitchDatabase<CR>")
      map("n", "<leader>Ss", ":SqlsShowSchemas<CR>")
      map("n", "<leader>Sc", ":SqlsShowConnections<CR>")
      map("n", "<leader>SC", ":SqlsSwitchConnection<CR>")
    end,
    capabilities = capabilities,
  })
end

return M
