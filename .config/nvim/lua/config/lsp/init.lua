local lsp = vim.lsp
local protocol = require("vim.lsp.protocol")
local lsp_status = require("lsp-status")

-- LSP default override
lsp_status.register_progress()
lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
-- TODO: Add LSP name on every diags
-- see https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-source-in-diagnostics
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(require("lsp_extensions.workspace.diagnostic").handler, {
  signs = {
    severity_limit = "Warning",
  },
  virtual_text = {
    severity_limit = "Warning",
  },
  update_in_insert = true,
  underline = true,
})

-- Custom Capabilities
local custom_capabilities = protocol.make_client_capabilities()
custom_capabilities = require("cmp_nvim_lsp").update_capabilities(custom_capabilities)

-- Custom attach
local custom_attach = function(client, bufnr)
  local bmap = function(type, key, value)
    vim.api.nvim_buf_set_keymap(bufnr, type, key, value, { noremap = true, silent = true })
  end

  -- LSP Keymapping
  bmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  bmap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
  bmap("n", "<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
  bmap("n", "<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
  bmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bmap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bmap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  bmap("n", "gr", "<cmd>Telescope lsp_references<CR>")
  bmap("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  bmap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  bmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  bmap("n", "gR", "<cmd>Lspsaga rename<CR>")
  bmap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  bmap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  bmap("n", "<leader>a", "<cmd>Lspsaga code_action<CR>")
  bmap("v", "<leader>a", "<cmd>Lspsaga range_code_action<CR>")
  bmap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  bmap("n", "<leader>lq", "<cmd>Telescope lsp_workspace_diagnostics<CR>")
  bmap("n", "<leader>lm", "<cmd>Telescope lsp_document_symbols<CR>")
  bmap("n", "<leader>lM", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")

  -- Disable server autoformat. Let null-ls handle it by default
  if client.name ~= "null-ls" then
    client.resolved_capabilities.document_formatting = false
  end

  -- Autoformat on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end

  -- Disable SignColumn and show diagnostic on LineNr
  vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
  vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
  vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
  vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })

  -- LSP Saga
  require("lspsaga").init_lsp_saga({
    use_saga_diagnostic_sign = false,
    dianostic_header_icon = "   ",
    code_action_icon = " ",
    code_action_prompt = {
      enable = true,
      sign = false,
      virtual_text = false,
    },
    code_action_keys = {
      quit = "<esc>",
      exec = "<CR>",
    },
    rename_action_keys = {
      quit = "<esc>",
      exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    server_filetype_map = {},
  })

  -- LSP Signature
  require("lsp_signature").on_attach({
    bind = true,
    doc_lines = 2,
    floating_window = false,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = "ﰠ ",
    hint_scheme = "Todo",
    use_lspsaga = false,
    hi_parameter = "Search",
    max_height = 12,
    max_width = 60,
    handler_opts = {
      border = "none",
    },
    extra_trigger_chars = { "(", ",", "." },
  })

  -- LSP Outline Symbols
  bmap("n", "<leader>ss", "<cmd>SymbolsOutline<CR>")
  vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    position = "right",
    keymaps = {
      close = "<esc>",
      goto_location = "<CR>",
      focus_location = "o",
      hover_symbol = "<K>",
      rename_symbol = "r",
      code_actions = "a",
    },
    lsp_blacklist = {},
  }

  -- Start nvim-cmp LSP source
  require("cmp_nvim_lsp").setup()

  -- Register LSP status
  lsp_status.on_attach(client)

  vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")
end

local servers = {
  "clangd",
  "denols",
  "flutter",
  "gopls",
  "null_ls",
  "omnisharp",
  "pylsp",
  "rust_analyzer",
  "sumneko",
  "texlab",
  "zls",
}

for _, server in ipairs(servers) do
  require("config.lsp." .. server).setup(custom_attach, custom_capabilities)
end
