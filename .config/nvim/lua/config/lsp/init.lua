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
  local bmap = function(type, key, value)
    vim.api.nvim_buf_set_keymap(bufnr, type, key, value, { noremap = true, silent = true })
  end

  -- LSP Keymapping
  bmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  bmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  bmap("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
  bmap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bmap("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>")
  bmap("n", "gr", "<cmd>Telescope lsp_references<CR>")
  bmap("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  bmap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  bmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  bmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
  bmap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  bmap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  bmap("n", "<leader>ci", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
  bmap("n", "<leader>co", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")
  bmap("n", "<leader>ss", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  -- bmap("n", "<leader>a", "<cmd>Telescope lsp_code_actions<CR>")
  bmap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  bmap("v", "<leader>a", "<cmd>Telescope lsp_range_code_action<CR>")
  bmap("n", "<leader>L", "<cmd>Telescope lsp_codelens<CR>")
  bmap("n", "<leader>lm", "<cmd>Telescope lsp_document_symbols<CR>")
  bmap("n", "<leader>lM", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")

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
