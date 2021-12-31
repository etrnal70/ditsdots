local lsp = vim.lsp
local lsp_status = require("lsp-status")
pcall(vim.cmd, [[packadd cmp-nvim-lsp]])

-- LSP default override
lsp_status.register_progress()
lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "solid",
})

-- Custom Capabilities
local custom_capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Custom attach
local custom_attach = function(client, bufnr)
  local bmap = function(type, lhs, rhs, func)
    vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, { callback = func, noremap = true, silent = true })
  end

  -- LSP Keymapping
  bmap("n", "K", "", vim.lsp.buf.hover)
  bmap("n", "gh", "", vim.lsp.buf.signature_help)
  bmap("n", "gD", "", vim.lsp.buf.declaration)
  bmap("n", "gR", "", vim.lsp.buf.rename)
  bmap("n", "gs", "", vim.lsp.buf.document_symbol)
  bmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  bmap("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
  bmap("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>")
  bmap("n", "gr", "<cmd>Telescope lsp_references<CR>")
  bmap("n", "gS", "<cmd>Telescope lsp_document_symbols<CR>")
  bmap("n", "gw", "<cmd>Telescope lsp_workspace_symbols<CR>")
  bmap("n", "gW", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
  bmap("n", "<leader>ci", "", vim.lsp.buf.incoming_calls)
  bmap("n", "<leader>co", "", vim.lsp.buf.outgoing_calls)
  bmap("n", "<leader>a", "", vim.lsp.buf.code_action)
  bmap("v", "<leader>a", "<cmd>Telescope lsp_range_code_action<CR>")
  -- bmap("n", "<leader>ll", "<cmd>Telescope lsp_codelens<CR>")

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

  -- vim-illuminate
  require("illuminate").on_attach(client)

  -- Register nvim-cmp LSP source
  require("cmp_nvim_lsp").setup()

  -- Register LSP status
  lsp_status.on_attach(client)

  vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")
end

-- TODO: Split to ftplugin
local servers = {
  "clangd",
  "denols",
  "dockerls",
  "flutter",
  "gopls",
  "omnisharp",
  "pyright",
  "rust_analyzer",
  "sumneko",
  "texlab",
  "zls",
}

for _, server in ipairs(servers) do
  require("config.lsp." .. server).setup(custom_attach, custom_capabilities)
end
