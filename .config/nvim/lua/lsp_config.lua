local lsp 	     = vim.lsp
local protocol   = require('vim.lsp.protocol')
local nvim_lsp   = require('lspconfig')
local configs    = require('lspconfig/configs')
local util       = require('lspconfig/util')
local flutter 	 = require('flutter-tools')

-- Diagnostic Configuration
lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(
lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    spacing = 4, 
    severity_limit = 'Warning',
  }, 
  signs = {
    severity_limit = 'Warning',
  },
  update_in_insert = true,
  underline = true,
}
)

-- Use custom implementation from nvim-lsputils and lspsaga
lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
	print("Starting LSP...")

  -- LSP Custom Label
	protocol.CompletionItemKind = {
		'';   -- Text          = 1;
		'';   -- Method        = 2;
		'ƒ';   -- Function      = 3;
		'';   -- Constructor   = 4;
		'識';  -- Field         = 5;
		'';   -- Variable      = 6;
		'';   -- Class         = 7;
		'ﰮ';   -- Interface     = 8;
		'';   -- Module        = 9;
		'';   -- Property      = 10;
		'';   -- Unit          = 11;
		'';   -- Value         = 12;
		'了';  -- Enum          = 13;
		'';   -- Keyword       = 14;
		'﬌';   -- Snippet       = 15;
		'';   -- Color         = 16;
		'';   -- File          = 17;
		'渚';  -- Reference     = 18;
		'';   -- Folder        = 19;
		'';   -- EnumMember    = 20;
		'';   -- Constant      = 21;
		'';   -- Struct        = 22;
		'鬒';  -- Event         = 23;
		'Ψ';   -- Operator      = 24;
		'';   -- TypeParameter = 25;
	}

  -- Enable incremental sync
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

  -- LSP Keymapping
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gh','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gy','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','gw','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','gc','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gn','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','ff','<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','[d','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
	map('n',']d','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	map('n','<leader>a','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>e','<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

        vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
        vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
        vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
        vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

	-- Rust inlay hints
	-- if vim.api.nvim_buf_get_option(0, 'filetype') == 'rust' then
	--  vim.cmd [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { aligned = false, prefix = " » " }]]
	-- end

	-- Dart label
	if vim.api.nvim_buf_get_option(0, 'filetype') == 'dart' then
		require('flutter-tools').setup{}
	end

	vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

-- Enable snippet support
local custom_capabilities = protocol.make_client_capabilities();
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP with default lspconfig repo
local servers = {'bashls','clangd','gopls', 'graphql','pyright','rust_analyzer','texlab','tsserver','yamlls','zls'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup{
		on_attach = custom_attach,
		capabilities = custom_capabilities,
	}
end

-- LSP with custom settings
nvim_lsp.dartls.setup{
	init_options = {
		closingLabels = true,
		outline = true,
		flutterOutline = true
	},
	handlers = {
		["dart/textDocument/publishClosingLabels"] = flutter.closing_tags,
		["dart/textDocument/publishOutline"] = flutter.outline
	},
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

nvim_lsp.texlab.setup{
	settings = {
		latex = {
			build = {
				onSave = true
			},
			lint = {
				onChange = true
			}
		}
	},
	on_attach = custom_attach,
	capabilities = custom_capabilities
}

-- Show diagnostics result on quickfix
do
	local method = "textDocument/publishDiagnostics"
	local default_callback = vim.lsp.callbacks[method]
	vim.lsp.callbacks[method] = function(err, method, result, client_id)
		default_callback(err, method, result, client_id)
		if result and result.diagnostics then
			for _, v in ipairs(result.diagnostics) do
				v.bufnr = client_id
				v.lnum = v.range.start.line + 1
				v.col = v.range.start.character + 1
				v.text = v.message
			end
			vim.lsp.util.set_qflist(result.diagnostics)
		end
	end
end


-- ###############################
-- #####      Completion     #####
-- ###############################
require('custom_func')

local set = vim.g
local cmd = vim.cmd

--Vsnip Keymap
cmd[[imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
cmd[[smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]

cmd[[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
cmd[[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

cmd[[imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
cmd[[smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
cmd[[imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]
cmd[[smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]

cmd[[nmap s <Plug>(vsnip-select-text)]]
cmd[[xmap s <Plug>(vsnip-select-text)]]
cmd[[nmap S <Plug>(vsnip-cut-text)]]
cmd[[xmap S <Plug>(vsnip-cut-text)]]

-- Use Tab and S-Tab to scroll completion
-- cmd[[imap <expr><TAB> v:lua.tab_complete()]]
-- cmd[[smap <expr><TAB> v:lua.tab_complete()]]
-- cmd[[imap <expr><S-TAB> v:lua.s_tab_complete()]]
-- cmd[[smap <expr><S-TAB> v:lua.s_tab_complete()]]

-- nvim-compe Configuration
-- vim.api.nvim_set_keymap(
--   'i', '<Tab>',
--   'pumvisible() ? "<C-n>" : "<Tab>"',
--   { noremap=true, expr=true }
-- )

cmd[[inoremap <silent><expr> <CR>      compe#confirm('<CR>')]]
cmd[[inoremap <silent><expr> <C-e>     compe#close('<C-e>')]]
cmd[[inoremap <silent><expr> <C-j>     compe#scroll({ 'delta': +4 })]]
cmd[[inoremap <silent><expr> <C-k>     compe#scroll({ 'delta': -4 })]]

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require('compe').setup {
  enabled = true;
  debug = false;
  min_length = 2;
  preselect = 'disable';

  -- TODO: Define per filetype
  source = {
    path = true;
    buffer = true;
    calc = false;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = false;
    spell = false;
    tags = false;
    snippets_nvim = false;
    treesitter = true;
  };
}


cmd[[set shortmess+=c]]
vim.o.completeopt = "menuone,noinsert,noselect"
-- cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]

-- ###############################
-- #####      Formatter      #####
-- ###############################
require('formatter').setup ({
  logging = false,
  rust = {
    -- Rustfmt
    function()
      return {
        exe = "rustfmt",
        args = {"--emit=stdout"},
        stdin = true
      }
    end
  },
})
