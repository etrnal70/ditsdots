local lsp = vim.lsp
local telescope = require("telescope.builtin")

lsp.handlers["textDocument/codeAction"] = telescope.lsp_code_actions
lsp.handlers["textDocument/definition"] = telescope.lsp_definitions
lsp.handlers["textDocument/documentSymbol"] = telescope.lsp_document_symbols
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
  border = "solid",
  max_width = 65,
  max_height = 22,
})
lsp.handlers["textDocument/implementation"] = telescope.lsp_implementations
lsp.handlers["textDocument/references"] = telescope.lsp_references
lsp.handlers["textDocument/typeDefinition"] = telescope.lsp_type_definitions
lsp.handlers["workspace/symbol"] = telescope.lsp_workspace_symbols
