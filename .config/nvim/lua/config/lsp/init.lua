local utils = require "config.lsp.utils"

utils.override_handlers()
utils.setup_autocmds()

for _, server in pairs(utils.servers) do
  require("config.lsp.server_configs." .. server).setup(utils.make_capabilities())
end

-- Java-only
-- vim.api.nvim_create_user_command("JavaStart", require("config.lsp.server_configs.jdtls").setup, {})
