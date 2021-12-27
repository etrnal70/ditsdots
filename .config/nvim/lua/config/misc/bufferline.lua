local diagnostic = vim.diagnostic

require("bufferline").setup({
  options = {
    diagnostics = false,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer" },
      { filetype = "dbui", text = "Dadbod-UI" },
    },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "relative_directory",
    custom_filter = function()
      return false
    end,
    custom_areas = {
      right = function()
        local result = {}

        --Diagnostics Count
        local diagnostic_error = vim.tbl_count(diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }))
        local diagnostic_warning = vim.tbl_count(diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN }))
        if diagnostic_error ~= 0 then
          table.insert(result, { text = "  " .. diagnostic_error .. " ", guifg = "#222222", guibg = "#EC5F67" })
        end
        if diagnostic_warning ~= 0 then
          table.insert(result, { text = "  " .. diagnostic_warning .. " ", guifg = "#222222", guibg = "#FABD2F" })
        end

        -- LSP-specific options
        for _, client in pairs(vim.lsp.get_active_clients()) do
          if client.name == "dartls" then
            if vim.g.flutter_tools_decorations.app_version ~= nil then
              table.insert(result, {
                text = " " .. vim.g.flutter_tools_decorations.app_version .. " ",
                guifg = "#222222",
                guibg = " #59B3EF",
              })
            end
          end
        end

        -- Git branch
        -- TODO: Remove fugitive dependency
        local git_status = vim.fn["fugitive#statusline"]()
        if git_status ~= "" then
          git_status = git_status:match("%((.*)%)")
          table.insert(result, { text = "  " .. git_status .. " ", guifg = "#222222", guibg = "#FF8800" })
        end

        return result
      end,
    },
  },
})
