local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").gopls.setup({
    settings = {
      gopls = {
        analyses = { unusedparams = true, unreachable = true },
        codelenses = {
          generate = true,
          gc_details = true,
          test = true,
          tidy = true,
        },
        usePlaceholders = true,
        semanticTokens = true,
        completeUnimported = true,
        staticcheck = true,
        matcher = "Fuzzy",
        diagnosticsDelay = "500ms",
        experimentalWatchedFileDelay = "100ms",
        gofumpt = false,
        buildFlags = { "-tags", "integration" },
        experimentalPostfixCompletions = true,
        experimentalUseInvalidMetadata = true,
      },
    },
    on_attach = function(client, bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      require("go").setup({
        gofmt = "gofumpt",
        tag_transform = true,
        test_template = "",
        test_template_dir = "",
        comment_placeholder = "",
        lsp_on_attach = false,
        lsp_document_formatting = false,
        dap_debug_keymap = false,
        dap_debug_vt = false,
      })
      on_attach(client, bufnr)
      map("n", "<leader>Gfs", ":GoFillStruct<CR>")
    end,
    capabilities = capabilities,
  })
end

return M
