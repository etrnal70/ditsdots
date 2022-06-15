local utils = require("config.lsp.utils")
pcall(require, "cmp_nvim_lsp")

-- Override handlers
utils.override_handlers()

local servers = {
  "clangd",
  -- "denols",
  -- "dockerls",
  "flutter",
  "gopls",
  "jsonls",
  "pylsp",
  -- "pyright",
  "rust_analyzer",
  "sumneko",
  "taplo",
  "texlab",
  "tsserver",
  "yamlls",
  "zls",
}

for _, server in ipairs(servers) do
  require("config.lsp." .. server).setup(utils.on_attach, utils.capabilities)
end
