local lsp = vim.lsp
local cmp_lsp = require("cmp_nvim_lsp")

-- LSP default override
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  border = "solid",
})

-- Custom Capabilities
local custom_capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Custom attach
local custom_attach = function(client, bufnr)
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- LSP Keymapping
  map("n", "K", lsp.buf.hover)
  map("n", "gh", lsp.buf.signature_help)
  map("n", "gD", lsp.buf.declaration)
  map("n", "gR", lsp.buf.rename)
  map("n", "gs", lsp.buf.document_symbol)
  map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  map("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
  map("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>")
  map("n", "gr", "<cmd>Telescope lsp_references<CR>")
  map("n", "gS", "<cmd>Telescope lsp_document_symbols<CR>")
  map("n", "gw", "<cmd>Telescope lsp_workspace_symbols<CR>")
  map("n", "gW", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
  map("n", "<leader>ci", lsp.buf.incoming_calls)
  map("n", "<leader>co", lsp.buf.outgoing_calls)
  map("n", "<leader>a", lsp.buf.code_action)
  map("v", "<leader>a", "<cmd>Telescope lsp_range_code_action<CR>")

  -- Disable server formatting capabilities
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  -- LSP Signature
  require("lsp_signature").on_attach({
    bind = true,
    floating_window = true,
    doc_lines = 0,
    handler_opts = {
      border = "solid",
    },
    hint_enable = false,
    hint_prefix = "ﰠ ",
    extra_trigger_chars = { "<", "[", "(", "{", ",", "." },
  })

  -- Register nvim-cmp LSP source
  cmp_lsp.setup()

  vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")
end

-- TODO: Split to ftplugin
local servers = {
  "clangd",
  -- "denols",
  "dockerls",
  "flutter",
  "gopls",
  "omnisharp",
  "pyright",
  "rust_analyzer",
  "sumneko",
  "texlab",
  "tsserver",
  "zls",
}

for _, server in ipairs(servers) do
  require("config.lsp." .. server).setup(custom_attach, custom_capabilities)
end
