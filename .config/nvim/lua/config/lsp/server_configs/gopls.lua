local M = {}

M.setup = function(capabilities)
  vim.lsp.config("gopls", {
    cmd = { "gopls", "-remote=auto" },
    settings = {
      gopls = {
        analyses = { unusedparams = true, unreachable = true },
        codelenses = {
          generate = true,
          gc_details = true,
          test = true,
          tidy = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        usePlaceholders = true,
        semanticTokens = true,
        completeUnimported = true,
        staticcheck = true,
        diagnosticsDelay = "1000ms",
        gofumpt = false,
        buildFlags = { "-tags", "integration" },
        experimentalPostfixCompletions = true,
      },
    },
    capabilities = capabilities,
  })
end

return M
