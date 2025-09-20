local M = {}

local lsp = vim.lsp
local utils = require "config.utils"
local telescope = require "telescope.builtin"

M.servers = {
  "clangd",
  -- "dockerls",
  "flutter",
  "gopls",
  "graphql",
  "jdtls",
  "jsonls",
  "lua_lsp",
  -- "marksman",
  "prismals",
  "pylsp",
  -- "pyright",
  -- "taplo",
  "texlab",
  "tinymist",
  "yamlls",
  "zls",
}

M.override_handlers = function()
  lsp.handlers["callHierarchy/incomingCalls"] = telescope.lsp_incoming_calls
  lsp.handlers["callHierarchy/outgoingCalls"] = telescope.lsp_outgoing_calls
  lsp.handlers["textDocument/definition"] = telescope.lsp_definitions
  lsp.handlers["textDocument/documentSymbol"] = telescope.lsp_document_symbols
  lsp.handlers["textDocument/implementation"] = telescope.lsp_implementations
  lsp.handlers["textDocument/references"] = telescope.lsp_references
  lsp.handlers["textDocument/typeDefinition"] = telescope.lsp_type_definitions
  lsp.handlers["workspace/symbol"] = telescope.lsp_workspace_symbols
end

M.make_capabilities = function()
  local cap = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  }

  cap = require("blink.cmp").get_lsp_capabilities(cap)
  return cap
end

M.setup_autocmds = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      if not (args.data and args.data.client_id) then
        return
      end

      local bufnr = args.buf
      local client_id = args.data.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      if not client then
        return
      end

      local map = utils.keymap

      -- LSP Keymapping
      map(bufnr, "n", "K", function()
        lsp.buf.hover {
          border = "solid",
          max_width = math.floor(vim.o.columns * 0.3),
          max_height = math.floor(vim.o.lines * 0.4),
        }
      end)
      map(bufnr, "n", "gD", lsp.buf.declaration)
      map(bufnr, "n", "gR", lsp.buf.rename)
      map(bufnr, "n", "gc", lsp.codelens.run)
      map(bufnr, "n", "gd", ":Glance definitions<CR>")
      map(bufnr, "n", "gi", ":Glance implementations<CR>")
      map(bufnr, "n", "gy", ":Glance type_definitons<CR>")
      map(bufnr, "n", "gr", ":Glance references<CR>")
      map(bufnr, "n", "gs", lsp.buf.document_symbol)
      map(bufnr, { "n", "v" }, "ga", lsp.buf.code_action)
      map(bufnr, "n", "gw", telescope.lsp_dynamic_workspace_symbols)
      map(bufnr, "n", "<leader>wl", function()
        vim.notify(vim.inspect(lsp.buf.list_workspace_folders()))
      end)
      map(bufnr, "n", "<leader>wa", lsp.buf.add_workspace_folder)
      map(bufnr, "n", "<leader>wr", lsp.buf.remove_workspace_folder)
      map(bufnr, "n", "<leader>ci", lsp.buf.incoming_calls)
      map(bufnr, "n", "<leader>co", lsp.buf.outgoing_calls)

      -- Formatting (Autoformat on save)
      if client:supports_method("textDocument/formatting", bufnr) then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            lsp.buf.format { bufnr = bufnr }
          end,
        })
      end

      if client:supports_method("textDocument/onTypeFormatting", bufnr) then
        vim.lsp.on_type_formatting.enable(true, { client_id = client_id })
      end

      -- Document color
      if client:supports_method "textDocument/documentColor" then
        vim.lsp.document_color.enable(true, args.buf, { style = "virtual" })
      end

      -- Code Lens
      if
        client:supports_method("textDocument/codeLens", bufnr)
        -- TODO Remove once codelens support virtual lines
        and client.name ~= "rust_analyzer"
        and client.name ~= "jdtls"
      then
        vim.api.nvim_create_autocmd(
          { "BufEnter", "CursorHold", "InsertLeave" },
          { buffer = bufnr, callback = lsp.codelens.refresh }
        )
      end

      -- Inlay Hints
      if client:supports_method("textDocument/inlayHint", bufnr) then
        lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end,
  })
end

return M
