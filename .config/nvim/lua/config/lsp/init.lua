local lsp = vim.lsp
local protocol = require("vim.lsp.protocol")
local nvim_lsp = require("lspconfig")
local lsp_status = require("lsp-status")
local tele = require("telescope.builtin")
local flutter_ext = require("flutter-tools")
local rust_ext = require("rust-tools")

local bmap = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
end

-- Diagnostic Configuration
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
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true
custom_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- LSP default override
lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- Custom attach
local custom_attach = function(client)
  -- LSP Keymapping
  bmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  bmap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
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

  if client.resolved_capabilities.document_formatting then
    bmap("n", "<leader>sf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    bmap("n", "<leader>sf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
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
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
      open = "o",
      vsplit = "s",
      split = "i",
      quit = "<esc>",
      scroll_down = "<C-j>",
      scroll_up = "<C-k>",
    },
    code_action_keys = {
      quit = "<esc>",
      exec = "<CR>",
    },
    rename_action_keys = {
      quit = "<C-c>",
      exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    server_filetype_map = {},
  })

  -- LSP Custom Label using lspkind.nvim
  require("lspkind").init()

  -- LSP Signature
  require("lsp_signature").on_attach({
    bind = true,
    doc_lines = 2,
    floating_window = true,
    fix_pos = true,
    hint_enable = false,
    hint_prefix = "🐼 ",
    hint_scheme = "String",
    use_lspsaga = false,
    hi_parameter = "Search",
    max_height = 12,
    max_width = 60,
    handler_opts = {
      border = "single",
    },
    extra_trigger_chars = {},
  })

  -- LSP Outline Symbols
  bmap("n", "<leader>ss", "<cmd>SymbolsOutline<CR>")
  vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    position = "right",
    keymaps = {
      close = "<Esc>",
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<K>",
      rename_symbol = "r",
      code_actions = "a",
    },
    lsp_blacklist = { "texlab", "dartls" },
  }

  -- Set omnifunc
  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

  -- Register LSP status
  lsp_status.register_progress()

  print("[" .. client.name .. "] " .. "Language Server Protocol started")
end

-- LSP with default lspconfig repo
local default_servers = { "bashls", "cssls", "dockerls", "pyright", "tsserver", "yamlls", "zls" }
for _, server in ipairs(default_servers) do
  nvim_lsp[server].setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

-- LSP with custom settings
-- clangd
nvim_lsp.clangd.setup({
  init_options = {
    clangdFileStatus = true,
  },
  on_attach = custom_attach,
  capabilities = custom_capabilities,
})

-- Flutter
flutter_ext.setup({
  experimental = {
    lsp_derive_paths = true,
  },
  flutter_path = "/home/hanifrmdhn/Development/flutter/bin/flutter",
  flutter_lookup_cmd = nil,
  debugger = {
    enabled = true,
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "Comment",
    prefix = " // ",
  },
  dev_log = {
    open_cmd = "tabedit",
  },
  outline = {
    open_cmd = "35vnew",
  },
  lsp = {
    on_attach = function(client)
      custom_attach(client)
      require("telescope").load_extension("flutter")
      bmap("n", "<leader>ss", "<cmd>FlutterOutline<CR>")
    end,
    capabilities = custom_capabilities,
    settings = {
      showTodos = true,
      completeFunctionCalls = false,
    },
  },
})

-- Gopls
nvim_lsp.gopls.setup({
  on_attach = function(client)
    custom_attach(client)
    require("go").setup({
      goimport = "gofumports",
      gofmt = "gofumpt",
      max_len = 120,
      transform = false,
      test_template = "",
      test_template_dir = "",
      comment_placeholder = "",
      verbose = false,
    })
    bmap("n", "<leader>Gd", "<cmd>GoCmt<CR>")
    bmap("n", "<leader>Gl", "<cmd>GoLint<CR>")
    bmap("n", "<leader>Gf", '<cmd>lua require"go.format".gofmt()<CR>')
    bmap("n", "<leader>Gat", "<cmd>GoAddTag<CR>")
    bmap("n", "<leader>Grt", "<cmd>GoRmTag<CR>")
  end,
  capabilities = custom_capabilities,
})

-- Rust-analyzer
rust_ext.setup({
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = " » ",
      other_hints_prefix = "=>",
    },
  },
  server = {
    on_attach = function(client)
      custom_attach(client)
      bmap("n", "<leader>rr", "<cmd>RustRunnables<CR>")
      bmap("n", "<leader>rc", "<cmd>RustOpenCargo<CR>")
      bmap("n", "<leader>rh", "<cmd>RustHoverActions<CR>")
      bmap("n", "<leader>rmu", "<cmd>RustMoveItemUp<CR>")
      bmap("n", "<leader>rmd", "<cmd>RustMoveItemDown<CR>")
    end,
  },
})

-- Sumneko-Lua
local luadev = require("lua-dev").setup({
  library = {
    vimruntime = true,
    types = true,
    plugins = true,
  },
  lspconfig = {
    cmd = { "lua-language-server" },
    on_attach = custom_attach,
    capabilities = custom_capabilities,
  },
})
nvim_lsp.sumneko_lua.setup(luadev)

-- Texlab
nvim_lsp.texlab.setup({
  settings = {
    latex = {
      build = {
        onSave = true,
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=build", "%f" },
        executable = "latexmk",
        outputDirectory = "build",
      },
      lint = {
        onChange = true,
      },
    },
  },
  on_attach = custom_attach,
  capabilities = custom_capabilities,
})
