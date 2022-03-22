local diagnostic = vim.diagnostic

require("bufferline").setup({
  options = {
    diagnostics = false,
    show_close_icon = false,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
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
        -- TODO: Switch to gitsigns
        -- local git_status = vim.g.gitsigns_head
        local git_status = vim.fn["fugitive#statusline"]()
        if git_status ~= "" then
          git_status = git_status:match("%((.*)%)")
          table.insert(
            result,
            { text = "  " .. git_status .. " ", guifg = "#222222", guibg = "#FF8800", gui = "bold,italic" }
          )
        end

        return result
      end,
    },
  },
})
