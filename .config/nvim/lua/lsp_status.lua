local util = require 'vim.lsp.util'
local aliases = {
  pyls_ms = 'MPLS',
}
local spinner_frames = {'⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'}
local index = 0
local status_timer = vim.loop.new_timer()

local M = {}

local function get_statusline()
  if #vim.lsp.buf_get_clients() == 0 then
    return ''
  end

  local lsp_messages = util.get_progress_messages()
  local msgs = {}
  for _, msg in ipairs(lsp_messages) do
    local name = aliases[msg.name] or msg.name
    if not msgs[name] then
      msgs[name] = {}
    end
    if msg.progress then
      local contents = msg.title
      if msg.message then
        contents = contents .. ' ' .. msg.message
      end

      if msg.percentage and msg.percentage > 0 then
        contents = contents .. ' (' .. math.ceil(msg.percentage) .. '%)'
      end

      contents = spinner_frames[index + 1] .. ' ' .. contents
      table.insert(msgs[name], contents)
    else
      table.insert(msgs[name], msg.content)
    end
  end

  for _, client in ipairs(vim.lsp.get_active_clients()) do
    local name = aliases[client.name] or client.name
    if not msgs[name] then
      msgs[name] = {}
    end
    local status = client.status
    if status then
      local uri = vim.uri_from_bufnr(0)
      if status[uri] then
        table.insert(msgs[name], 1, status[uri])
      end
    end
  end

  local result = ''
  for name, msgs in pairs(msgs) do
    result = result .. name .. ': '
    result = result .. vim.trim(table.concat(msgs, ' '))
  end
  return result
end

function M.update_text()
  vim.g.lsp_status = get_statusline()
end

status_timer:start(100, 100, vim.schedule_wrap(function()
  index = (index + 1) % #spinner_frames
  M.update_text()
end))

return M
