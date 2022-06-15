require("tabline_framework").setup({
  hl = { fg = "#888888", bg = "#222222" },
  hl_fill = { fg = "#888888", bg = "NONE" },
  render = function(f)
    f.make_tabs(function(info)
      f.add(" Tab " .. info.index .. " ")
    end)

    -- Align to right
    f.add_spacer()

    -- Language-specific
    -- TODO: Might be too expensive
    -- for _, client in pairs(vim.lsp.get_active_clients()) do
    --   if client.name == "dartls" then
    --     if vim.g.flutter_tools_decorations.app_version ~= nil then
    --       f.add({ " " .. vim.g.flutter_tools_decorations.app_version .. " ", fg = "#222222", bg = "#59B3EF" })
    --     end
    --   end
    -- end

    -- Diagnostics
    local errors = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }))
    local warnings = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN }))
    local hints = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.HINT }))

    if errors ~= 0 then
      f.add({ "  " .. errors .. " ", fg = "#222222", bg = "#EC5F67" })
    end
    if warnings ~= 0 then
      f.add({ "  " .. warnings .. " ", fg = "#222222", bg = "#FABD2F" })
    end
    if hints ~= 0 then
      f.add({ "  " .. hints .. " ", fg = "#222222", bg = "#A0B9D8" })
    end

    -- Git Branch
    local git_branch = vim.g.gitsigns_head
    if git_branch and git_branch ~= "" then
      f.add({ "  " .. git_branch .. " ", fg = "#222222", bg = "#FF8800", bold = true })
    end
  end,
})
