local M = {}

M.setup = function(capabilities)
  vim.lsp.config("pylsp", {
    capabilities = capabilities,
    settings = {
      pylsp = {
        plugins = {
          ruff = {
            enabled = true,
            extendSelect = { "I" },
          },
          mypy = {
            enabled = true,
            dmypy = true,
            report_progress = true,
          },
        },
      },
    },
  })
end

return M
