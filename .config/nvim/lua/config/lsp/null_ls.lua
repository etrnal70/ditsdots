vim.cmd("PackerLoad null-ls.nvim")

local null_ls = require("null-ls")
local builtins = null_ls.builtins

local sources = {
  builtins.formatting.stylua.with({
    condition = function(utils)
      return utils.root_has_file("stylua.toml")
    end,
  }),
  builtins.formatting.rustfmt,
  builtins.code_actions.gitsigns,
}

local M = {}

M.setup = function(on_attach, capabilities)
  null_ls.config({
    sources = sources,
  })
  require("lspconfig")["null-ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 250,
    },
  })
end

return M
