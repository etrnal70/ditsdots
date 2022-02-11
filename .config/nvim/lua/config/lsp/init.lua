local lsp = vim.lsp
local cmp_lsp = require("cmp_nvim_lsp")
local telescope = require("telescope.builtin")

-- LSP default override
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
  border = "solid",
})

-- Custom Capabilities
local capabilities = cmp_lsp.update_capabilities(lsp.protocol.make_client_capabilities())

-- Custom attach
local on_attach = function(client, bufnr)
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
  map("n", "gd", telescope.lsp_definitions)
  map("n", "gi", telescope.lsp_implementations)
  map("n", "gy", telescope.lsp_type_definitions)
  map("n", "gr", telescope.lsp_references)
  map("n", "gS", telescope.lsp_document_symbols)
  map("n", "gw", telescope.lsp_workspace_symbols)
  map("n", "gW", telescope.lsp_dynamic_workspace_symbols)
  map("n", "<leader>ci", lsp.buf.incoming_calls)
  map("n", "<leader>co", lsp.buf.outgoing_calls)
  map("n", "<leader>a", telescope.lsp_code_actions)
  map("v", "<leader>a", telescope.lsp_range_code_actions)

  -- Disable server formatting capabilities
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  -- LSP Signature
  require("lsp_signature").on_attach({
    floating_window = false,
    hint_enable = true,
    hint_prefix = "ﰠ ",
    auto_close_after = 8,
    extra_trigger_chars = { "<", "[", "(", "{", ",", "." },
    timer_interval = 500,
  })

  -- LSP Virtual Lines
  require("lsp_lines").register_lsp_virtual_lines()

  -- Register nvim-cmp LSP source
  cmp_lsp.setup()

  vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")
end

local servers = {
  "clangd",
  "denols",
  "dockerls",
  "flutter",
  "gopls",
  -- "jdtls",
  -- "metals",
  "omnisharp",
  "pyright",
  "rust_analyzer",
  "sqls",
  "sumneko",
  "texlab",
  "tsserver",
  "zls",
}

for _, server in ipairs(servers) do
  require("config.lsp." .. server).setup(on_attach, capabilities)
end
