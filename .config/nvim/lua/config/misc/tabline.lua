require("tabline_framework").setup({
  hl = { fg = "#888888", bg = "#222222" },
  hl_fill = { fg = "#888888", bg = "NONE" },
  render = function(f)
    f.make_tabs(function(info)
      local icon_color = f.icon_color(info.filename)
      if info.current then
        f.set_bg(icon_color)
      end

      if info.filename then
        f.add(" " .. f.icon(info.filename) .. " ")
        f.add(info.filename or "[no name]")
        f.add(" ")
        f.add((info.modified and "⏺ "))
      end
    end)

    -- Align to right
    f.add_spacer()

    -- Language-specific
    -- TODO: Might be too expensive
    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
      if client.name == "dartls" then
        if vim.g.flutter_tools_decorations.app_version ~= nil then
          f.add({ " " .. vim.g.flutter_tools_decorations.app_version .. " ", fg = "#222222", bg = "#59B3EF" })
        end
      end
    end

    -- Diagnostics
    local errors = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }))
    local warnings = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN }))

    if errors ~= 0 then
      f.add({ "  " .. errors .. " ", fg = "#222222", bg = "#EC5F67" })
    end
    if warnings ~= 0 then
      f.add({ "  " .. warnings .. " ", fg = "#222222", bg = "#FABD2F" })
    end

    -- Git Branch
    -- TODO: Switch to gitsigns / plenary-based
    local git_branch = vim.fn["fugitive#statusline"]()
    if git_branch ~= "" then
      git_branch = git_branch:match("%((.*)%)")
      f.add({ "  " .. git_branch .. " ", fg = "#222222", bg = "#FF8800", bold = true })
    end
  end,
})
