require('completion')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
          spacing = 3,
        },
        signs = true,
        update_in_insert = true,
    }
)

local protocol   = require('vim.lsp.protocol')
local lsp        = require('lspconfig')
local configs    = require('lspconfig/configs')
local util       = require('lspconfig/util')
local completion = require('completion')
local status     = require('lsp-status')

local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
  protocol.CompletionItemKind = {
		'';             -- Text          = 1;
		'ƒ';             -- Method        = 2;
		'ƒ';             -- Function      = 3;
		'';             -- Constructor   = 4;
		'識';            -- Field         = 5;
		'𝝬';             -- Variable      = 6;
		'';             -- Class         = 7;
		'ﰮ';             -- Interface     = 8;
		'';             -- Module        = 9;
		'Property';      -- Property      = 10;
		'Unit';          -- Unit          = 11;
		'Value';         -- Value         = 12;
		'了';            -- Enum          = 13;
		'';             -- Keyword       = 14;
		'﬌';             -- Snippet       = 15;
		'Color';         -- Color         = 16;
		'';             -- File          = 17;
		'Reference';     -- Reference     = 18;
		'';             -- Folder        = 19;
		'';             -- EnumMember    = 20;
		'';             -- Constant      = 21;
		'';             -- Struct        = 22;
		'Event';         -- Event         = 23;
		'Operator';      -- Operator      = 24;
		'TypeParameter'; -- TypeParameter = 25;
	}

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

  print("Starting LSP ...")
  completion.on_attach(client) 
  require "lsp-status".on_attach(client)

  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','gh','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','gy','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','gs','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','gw','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  map('n','gc','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','ff','<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>a','<cmd>lua vim.lsp.buf.code_action()<CR>')

  vim.cmd[[sign define LspDiagnosticsSignError text=▲  texthl=LspDiagnosticsSignError linehl= numhl=]]
  vim.cmd[[sign define LspDiagnosticsSignWarning text=◆ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
  vim.cmd[[sign define LspDiagnosticsSignInformation text=⌘ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
  vim.cmd[[sign define LspDiagnosticsSignHint text=❖ texthl=LspDiagnosticsSignHint linehl= numhl=]]

  if vim.api.nvim_buf_get_option(0, 'filetype') == 'rust' then
    vim.cmd [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { aligned = false, prefix = " » " }]]
  end

  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

local lsp_status = require "lsp-status"
lsp_status.register_progress()
local custom_capabilities = lsp_status.capabilities
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- -- bash -- --
configs.custom_bash = {
    default_config = { cmd = {"bash-language-server", "start"},
        filetypes = {"sh"},
        root_dir = util.path.dirname,
        on_attach = custom_attach,
    },
}

-- -- dart -- --
configs.custom_dart = {
  default_config = {
    cmd = { "dart", "./snapshots/analysis_server.dart.snapshot", "--lsp" },
    filetypes = { "dart" },
    init_options = {
      closingLabels = true, 
      onlyAnalyzerProjectsWithOpenFiles = false,
      flutterOutline = false,
      outline = false,
      suggestFromUnimportedLibraries = true,
    },
    root_dir = util.root_pattern("pubspec.yml"),
      on_attach = custom_attach,
      capabilities = custom_capabilities
  }
}

-- -- tsserver -- -- 
configs.custom_tsserver = {
  default_config = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern( "package.json", "tsconfig.json", ".git" ),
    on_attach = custom_attach,
    capabilities = custom_capabilities
  }
}

-- -- rust -- --
configs.custom_rust = {
  default_config = {
    cmd = { "rust-analyzer" },
    filetypes = {"rust"},
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {}
    },
    on_attach = custom_attach,
    capabilities = custom_capabilities
  }
}

-- -- ccls -- --
configs.custom_ccls = {
  default_config = {
    cmd = { "ccls" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    on_attach = custom_attach,
    capabilities = custom_capabilities
  },
}

-- -- cmake -- --
configs.custom_cmake = {
  default_config = {
    cmd = {"cmake-language-server"},
    filetypes = { "cmake" },
    init_options = {
      buildDirectory = "build"
    },
    root_dir = util.root_pattern(".git", "compile_commands.json", "build"),
    on_attach = custom_attach,
  },
}

-- -- docker -- --
configs.custom_docker = {
  default_config = {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile", "Dockerfile" },
    root_dir = util.root_pattern("Dockerfile"),
    on_attach = custom_attach,
  },
}

-- -- texlab -- --
configs.custom_texlab = {
default_config = {
  cmd = {"texlab"},
  filetypes = { "tex", "bib" },
  root_dir = util.root_pattern("."),
  on_attach = custom_attach,
  settings = {
      bibtex = {
        formatting = {
          lineLength = 120
        }
      },
      latex = {
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1" },
          executable = "latexmk",
          onSave = true
        },
        forwardSearch = {
          args = {},
          onSave = true
        },
        lint = {
          onChange = true
        }
      }
    }
}
}

lsp.custom_ccls.setup({})
lsp.custom_cmake.setup({})
lsp.custom_rust.setup({})
lsp.custom_bash.setup({})
lsp.custom_docker.setup({})
lsp.custom_texlab.setup({})
lsp.custom_dart.setup({})
lsp.custom_tsserver.setup({})

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
