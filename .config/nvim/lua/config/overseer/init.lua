local M = {}

local setup_keybind = function()
  vim.api.nvim_create_user_command("OverseerRunLast", function()
    require("config.overseer.custom").action_last "restart"
  end, {})
  vim.api.nvim_create_user_command("OverseerOpenLogLast", function()
    require("config.overseer.custom").action_last "open float"
  end, {})
end

function M.setup()
  require("overseer").setup {}
  setup_keybind()
end

return M
