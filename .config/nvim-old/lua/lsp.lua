vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
    }
)

local lsp        = require "lspconfig"
local configs    = require "lspconfig/configs"
local util       = require "lspconfig/util"

local custom_attach = function(client)
  print("Starting LSP")
  require "lsp-status".register_progress()
  require "lsp-status".on_attach(client)

  map('n','c-]','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gD','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','c-k','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','1gD','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','g0','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  map('n','gd','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','ff','<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>a','<cmd>lua vim.lsp.buf.code_action()<CR>')
end

-- [rust-analyzer,ccls]
-- local lsp_status = require "lsp-status"
-- lsp_status.register_progress()

-- -- bash -- --
configs.custom_bash = {
    default_config = {
        cmd = {"bash-language-server", "start"},
        filetypes = {"sh"},
        root_dir = util.path.dirname
    }
}

-- -- rust -- --
configs.custom_rust = {
  default_config = {
    cmd = { "rust-analyzer" },
    filetypes = {"rust", "rs"},
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {}
    },
    on_attach = custom_attach,
    capabilities = lsp_status.capabilities
  }
}

-- -- ccls -- --
configs.custom_ccls = {
  default_config = {
    cmd = { "ccls" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
  },
  on_attach = custom_attach, 
  capabilities = lsp_status.capabilities
}

-- -- cmake -- --
configs.custom_cmake = {
  default_config = {
    cmd = {"cmake-language-server"},
    filetypes = { "cmake" },
    init_options = {
      buildDirectory = "build"
    },
    root_dir = util.root_pattern(".git", "compile_commands.json", "build")
  }
}

-- -- docker -- --
configs.custom_docker = {
  default_config = {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile", "Dockerfile" },
    root_dir = util.root_pattern("Dockerfile")
  }
}

-- -- texlab -- --
configs.custom_texlab = {
default_config = {
  cmd = {"texlab"},
  filetypes = { "tex", "bib" },
  root_dir = util.root_pattern("."),
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
          onSave = false
        },
        forwardSearch = {
          args = {},
          onSave = false
        },
        lint = {
          onChange = false
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

