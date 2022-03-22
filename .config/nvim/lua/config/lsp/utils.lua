local M = {}

local lsp = vim.lsp
local telescope = require("telescope.builtin")

M.override_handlers = function()
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
end

M.capabilities = require("cmp_nvim_lsp").update_capabilities(lsp.protocol.make_client_capabilities())

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
  map("n", "gd", lsp.buf.definition)
  map("n", "gi", lsp.buf.implementation)
  map("n", "gy", lsp.buf.type_definition)
  map("n", "gr", lsp.buf.references)
  map("n", "gs", lsp.buf.document_symbol)
  map("n", "gw", lsp.buf.workspace_symbol)
  map("n", "ga", telescope.lsp_code_actions)
  map("v", "ga", telescope.lsp_range_code_actions)
  map("n", "gW", telescope.lsp_dynamic_workspace_symbols)
  map("i", "<C-k>", lsp.buf.signature_help)
  map("n", "<leader>wl", function()
    print(vim.inspect(lsp.buf.list_workspace_folders()))
  end)
  map("n", "<leader>wa", lsp.buf.add_workspace_folder)
  map("n", "<leader>wr", lsp.buf.remove_workspace_folder)
  map("n", "<leader>ci", lsp.buf.incoming_calls)
  map("n", "<leader>co", lsp.buf.outgoing_calls)

  -- Disable server formatting capabilities
  if client.name ~= "clangd" then -- integration for clang-format is broken, use native clangd for now
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  -- Document Highlight
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_create_autocmd("CursorHold", { buffer = bufnr, callback = vim.lsp.buf.document_highlight })
    vim.api.nvim_create_autocmd("CursorMoved", { buffer = bufnr, callback = vim.lsp.buf.clear_references })
  end

  -- Semantic Token
  if client.resolved_capabilities.semantic_tokens_full then
    vim.api.nvim_create_autocmd(
      { "BufEnter", "CursorHold", "InsertLeave" },
      { buffer = bufnr, callback = lsp.buf.semantic_tokens_full }
    )
  end

  -- Register nvim-cmp LSP source
  require("cmp_nvim_lsp").setup()

  vim.notify("[" .. client.name .. "] " .. "Language server started")
end

return M
