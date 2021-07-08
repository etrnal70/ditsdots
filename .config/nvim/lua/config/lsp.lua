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

-- Use custom implementation from various plugins
lsp.handlers["textDocument/references"] = tele.lsp_references
lsp.handlers["workspace/symbol"] = tele.lsp_workspace_symbols
lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- Custom attach
local custom_attach = function(client)
  -- LSP Keymapping
  bmap("n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions(require("telescope.themes").get_ivy())<CR>')
  bmap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
  bmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bmap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bmap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  bmap("n", "gr", '<cmd>lua require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy())<CR>')
  bmap("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  bmap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  bmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  bmap("n", "gR", "<cmd>Lspsaga rename<CR>")
  bmap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  bmap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  bmap("n", "<leader>a", "<cmd>Lspsaga code_action<CR>")
  bmap("v", "<leader>a", "<cmd>Lspsaga range_code_action<CR>")
  bmap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")

  if client.resolved_capabilities.document_formatting then
    bmap("n", "<leader>sf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    bmap("n", "<leader>sf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
  end

  -- Additonal Keymaps
  bmap("n", "<leader>lq", "<cmd>lua require'config.telescope'.lsp_workspace_diagnostic_ivy()<CR>")

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

-- ###############################
-- #####      Completion     #####
-- ###############################
local set = vim.g
local cmd = vim.cmd
local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

--Vsnip Keymap
cmd([[imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']])
cmd([[smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']])

cmd([[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
cmd([[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

cmd([[imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']])
cmd([[smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']])
cmd([[imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']])
cmd([[smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']])

cmd([[nmap s <Plug>(vsnip-select-text)]])
cmd([[xmap s <Plug>(vsnip-select-text)]])
cmd([[nmap S <Plug>(vsnip-cut-text)]])
cmd([[xmap S <Plug>(vsnip-cut-text)]])

-- Vsnip Location
set.vsnip_snippet_dir = "~/.config/nvim/snippet"

-- Remove all <CR> keybinding
set.completion_confirm_key = ""

-- nvim-autopairs
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt" },
  enable_moveright = true,
  enable_afterquota = true,
  enable_check_bracket_line = true,
  check_ts = true,
})
require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true,
})

-- Custom Rules (might be refactored to new file)
npairs.add_rules({
  rule("$", "$", { "tex", "latex" })
    :with_pair(cond.not_after_regex_check("%%"))
    :with_pair(cond.not_before_regex_check("xxx", 3))
    :with_move(cond.none())
    :with_del(cond.not_after_regex_check("xx"))
    :with_cr(cond.none()),
})
npairs.add_rules({
  rule("$$", "$$", "tex"):with_pair(function(opts)
    print(vim.inspect(opts))
    if opts.line == "aa $$" then
      return false
    end
  end),
})

cmd([[inoremap <silent><expr> <C-j>     compe#scroll({ 'delta': +2 })]])
cmd([[inoremap <silent><expr> <C-k>     compe#scroll({ 'delta': -2 })]])

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-n>")
  elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
    return t("<Plug>(vsnip-expand-or-jump)")
  elseif check_back_space() then
    return t("<Tab>")
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-p>")
  elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
    return t("<Plug>(vsnip-jump-prev)")
  else
    return t("<S-Tab>")
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

require("compe").setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "disable",
  throttle_time = 40,
  source_timeout = 100,
  incomplete_delay = 200,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 50,
  documentation = true,

  source = {
    path = true,
    buffer = false,
    calc = false,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = false,
    spell = false,
    tags = false,
    snippets_nvim = false,
    treesitter = false,
    dadbod = true,
    orgmode = true,
  },
})
