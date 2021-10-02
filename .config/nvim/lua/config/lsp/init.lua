local lsp = vim.lsp
local protocol = require("vim.lsp.protocol")
local lsp_status = require("lsp-status")
pcall(vim.cmd, [[packadd cmp-nvim-lsp]])

-- LSP default override
lsp_status.register_progress()
lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "solid",
})
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(require("lsp_extensions.workspace.diagnostic").handler, {})

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
  bmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bmap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bmap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  bmap("n", "gr", "<cmd>Telescope lsp_references<CR>")
  bmap("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  bmap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  bmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  bmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
  bmap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  bmap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  bmap("n", "<leader>a", "<cmd>CodeActionMenu<CR>")
  bmap("v", "<leader>a", "<cmd>CodeActionMenu()<CR>")
  bmap("n", "<leader>lq", "<cmd>Telescope lsp_workspace_diagnostics<CR>")
  bmap("n", "<leader>lm", "<cmd>Telescope lsp_document_symbols<CR>")
  bmap("n", "<leader>lM", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
  bmap("n", "<leader>sf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")

  -- Disable server autoformat. Let null-ls handle it by default
  if client.name ~= "null-ls" then
    client.resolved_capabilities.document_formatting = false
  end

  -- Autoformat on save
  --[[ if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end ]]

  -- LSP Signature
  require("lsp_signature").on_attach({
    bind = true,
    doc_lines = 2,
    floating_window = false,
    floating_window_above_first = true,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = "ﰠ ",
    hint_scheme = "Todo",
    use_lspsaga = false,
    hi_parameter = "Search",
    max_height = 12,
    max_width = 60,
    transparency = 10,
    handler_opts = {
      border = "single",
    },
    extra_trigger_chars = { "<", "[", "(", ",", "." },
  })

  -- vim-illuminate
  require("illuminate").on_attach(client)

  -- LSP Outline Symbols
  bmap("n", "<leader>ss", "<cmd>SymbolsOutline<CR>")

  -- Start nvim-cmp LSP source
  require("cmp_nvim_lsp").setup()

  -- Register LSP status
  lsp_status.on_attach(client)

  vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")
end

-- TODO: Split to ftplugin
local servers = {
  "clangd",
  "denols",
  "flutter",
  "gopls",
  "null_ls",
  "omnisharp",
  -- "pylsp",
  "pyright",
  "rust_analyzer",
  "sumneko",
  "texlab",
  "zls",
}

for _, server in ipairs(servers) do
  require("config.lsp." .. server).setup(custom_attach, custom_capabilities)
end
