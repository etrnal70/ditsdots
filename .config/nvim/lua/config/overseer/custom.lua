local overseer = require "overseer"
local M = {}

-- Do action on last task
-- @param action string
function M.action_last(action)
  local tasks = overseer.list_tasks { recent_first = true }
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], action)
  end
end

local spin = function()
  if _G.spinner_idx == vim.tbl_count(_G.spinner) then
    _G.spinner_idx = 1
  else
    _G.spinner_idx = _G.spinner_idx + 1
  end
end

local timer = vim.uv.new_timer()
local start_loop = function()
  timer:start(0, 500, function()
    vim.defer_fn(spin, 500)
    if vim.tbl_isempty(overseer.list_tasks { status = "RUNNING" }) then
      timer:close()
    end
  end)
end

function M.get_status()
  local tasks = vim.tbl_count(require("overseer").list_tasks { status = "RUNNING" })
  -- vim.schedule_wrap(start_loop)
  return _G.spinner[_G.spinner_idx] .. " " .. tasks .. " task running..."
end

return M
