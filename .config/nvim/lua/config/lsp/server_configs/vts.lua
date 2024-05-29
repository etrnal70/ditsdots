local M = {}

M.setup = function(capabilities)
  require("lspconfig.configs").vtsls = {
    default_config = {
      name = "vtsls",
      autostart = true,
      cmd = { "vtsls", "--stdio" },
      filetypes = { "typescript", "javascript" },
      root_dir = vim.uv.cwd,
    },
  }

  require("lspconfig").vtsls.setup {
    capabilities = capabilities,
  }
end

return M
