local M = {}

local lsp = vim.lsp
local telescope = require("telescope.builtin")

M.override_handlers = function()
  lsp.handlers["textDocument/codeAction"] = telescope.lsp_code_actions
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
  lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
    config = config or {}

    if not (result and result.signatures and result.signatures[1]) then
      return
    end

    local active_signature = result.activeSignature or 0
    if active_signature >= #result.signatures or active_signature < 0 then
      active_signature = 0
    end
    -- Trim signature documentation
    result.signatures[active_signature + 1].documentation = nil

    local lines_above = vim.fn.winline() - 1
    local lines_below = vim.fn.winheight(0) - lines_above

    -- TODO: Calculcate wrap height (but how ?)
    -- Prefer window to be on top of cursor
    if lines_above < lines_below then
      config.offset_y = -2
    end

    config.focusable = false
    config.max_width = 45
    config.silent = true

    return lsp.handlers.signature_help(_, result, ctx, config)
  end
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

  -- TODO: Resolved capabilities will be dropped !!!
  -- FIX:(1) s/resolved_capabilities/server_capabilities
  -- FIX:(2) Use nested keys

  -- Disable server formatting capabilities
  if client.name ~= "clangd" then -- integration for clang-format is broken, use native clangd for now
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  -- Code Lens
  if client.resolved_capabilities.code_lens and client.name ~= "rust_analyzer" then
    vim.api.nvim_create_autocmd(
      { "BufEnter", "CursorHold", "InsertLeave" },
      { buffer = bufnr, callback = lsp.codelens.refresh }
    )
  end

  -- Document Highlight
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_create_autocmd("CursorHold", { buffer = bufnr, callback = lsp.buf.document_highlight })
    vim.api.nvim_create_autocmd("CursorMoved", { buffer = bufnr, callback = lsp.buf.clear_references })
  end

  -- Semantic Token
  if client.resolved_capabilities.semantic_tokens_full then
    vim.api.nvim_create_autocmd(
      { "CursorHold", "BufEnter" },
      { buffer = bufnr, callback = lsp.buf.semantic_tokens_full }
    )
  end

  if client.resolved_capabilities.signature_help then
    vim.api.nvim_create_autocmd(
      { "InsertEnter", "CursorMovedI" },
      { buffer = bufnr, callback = lsp.buf.signature_help }
    )
  end

  -- Register nvim-cmp LSP source
  require("cmp_nvim_lsp").setup()

  print("[" .. client.name .. "] " .. "Language server started")
end

return M
