local M = {}

local root_dir = require("jdtls.setup").find_root { ".git", ".gradle", "mvnw", "gradlew" }

local config = {
  cmd = { "jdtls" },
  root_dir = root_dir,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
    },
  },
}

M.run = function(capabilities)
  config.capabilities = capabilities
  config.handlers = vim.lsp.handlers
  config.handlers["language/status"] = function() end
  require("jdtls").start_or_attach(config)
  require("jdtls").setup_dap { hotcodereplace = "auto" }
end

M.setup = function()
  -- Special handling for jdtls, which register autocmd
  -- instead of triggering attach
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java" },
    callback = function()
      local utils = require "config.lsp.utils"
      require("config.lsp.server_configs.jdtls").run(utils.capabilities)
    end,
  })
end

return M
