local M = {}

local lsp = vim.lsp
local telescope = require "telescope.builtin"

M.override_handlers = function()
  lsp.handlers["callHierarchy/incomingCalls"] = telescope.lsp_incoming_calls
  lsp.handlers["callHierarchy/outgoingCalls"] = telescope.lsp_outgoing_calls
  lsp.handlers["textDocument/definition"] = telescope.lsp_definitions
  lsp.handlers["textDocument/documentSymbol"] = telescope.lsp_document_symbols
  lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = "solid",
    max_width = 60,
    max_height = 19,
  })
  lsp.handlers["textDocument/implementation"] = telescope.lsp_implementations
  lsp.handlers["textDocument/references"] = telescope.lsp_references
  lsp.handlers["textDocument/typeDefinition"] = telescope.lsp_type_definitions
  lsp.handlers["workspace/symbol"] = telescope.lsp_workspace_symbols
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

M.on_attach = function(client, bufnr)
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- LSP Keymapping
  map("n", "K", lsp.buf.hover)
  map("n", "gD", lsp.buf.declaration)
  map("n", "gR", lsp.buf.rename)
  map("n", "gc", lsp.codelens.run)
  -- map("n", "gd", lsp.buf.definition)
  map("n", "gd", ":Glance definitions<CR>")
  -- map("n", "gi", lsp.buf.implementation)
  map("n", "gi", ":Glance implementations<CR>")
  map("n", "gy", lsp.buf.type_definition)
  -- map("n", "gr", lsp.buf.references)
  map("n", "gr", ":Glance references<CR>")
  map("n", "gs", lsp.buf.document_symbol)
  map("n", "gw", lsp.buf.workspace_symbol)
  map({ "n", "v" }, "ga", lsp.buf.code_action)
  map("n", "gW", telescope.lsp_dynamic_workspace_symbols)
  map("i", "<C-k>", lsp.buf.signature_help)
  map("n", "<leader>wl", function()
    print(vim.inspect(lsp.buf.list_workspace_folders()))
  end)
  map("n", "<leader>wa", lsp.buf.add_workspace_folder)
  map("n", "<leader>wr", lsp.buf.remove_workspace_folder)
  map("n", "<leader>ci", lsp.buf.incoming_calls)
  map("n", "<leader>co", lsp.buf.outgoing_calls)

  -- Code Action (lightbulb)
  if client.supports_method "textDocument/codeAction" then
    vim.api.nvim_create_autocmd(
      { "CursorHold", "CursorHoldI" },
      { buffer = bufnr, callback = require("nvim-lightbulb").update_lightbulb }
    )
  end

  -- Code Lens
  if client.supports_method "textDocument/codeLens" and client.name ~= "rust_analyzer" then
    vim.api.nvim_create_autocmd(
      { "BufEnter", "CursorHold", "InsertLeave" },
      { buffer = bufnr, callback = lsp.codelens.refresh }
    )
  end

  -- Semantic Token
  -- if client.supports_method "textDocument/semanticTokens/full" then
  --   vim.api.nvim_create_autocmd(
  --     { "CursorHold", "BufEnter" },
  --     { buffer = bufnr, callback = lsp.buf.semantic_tokens_full }
  --   )
  -- end

  -- Inlay Hints
  -- if client.supports_method("textDocument/inlayHints") then
  --   require("lsp-inlayhints").on_attach(client, bufnr)
  -- end

  -- nvim-navic

  if client.supports_method "textDocument/documentSymbol" then
    require("nvim-navic").attach(client, bufnr)
  end

  -- Register nvim-cmp LSP source
  if client.name ~= "null-ls" then
    require("cmp_nvim_lsp").setup()
  end
end

return M
