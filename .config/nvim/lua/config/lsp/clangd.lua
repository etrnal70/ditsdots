local M = {}

M.setup = function(on_attach, capabilities)
  require("clangd_extensions").setup({
    server = {
      cmd = { "clangd", "--completion-style=bundled", "--limit-results=50", "--pch-storage=memory" },
      init_options = {
        clangdFileStatus = true,
      },
      on_attach = on_attach,
      capabilities = capabilities,
    },
  })
end

return M
