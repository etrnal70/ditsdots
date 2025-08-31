local cmp = require "blink.cmp"
local colorful_menu = require "colorful-menu"
local utils = require "config.completion.utils"

cmp.setup {
  keymap = {
    preset = "none",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-j>"] = { "scroll_documentation_up", "fallback" },
    ["<C-k>"] = { "scroll_documentation_down", "fallback" },
    ["<C-Space>"] = { "show", "fallback" },
    ["<Space>"] = {
      function(c)
        local item = require("blink.cmp.completion.list").get_selected_item()
        if item ~= nil then
          if c.snippet_active() then
            return c.accept {
              callback = utils.append_space(item),
            }
          else
            return c.select_and_accept()
          end
        end
      end,
      "fallback",
    },
  },
  signature = { enabled = true },
  fuzzy = { prebuilt_binaries = { force_version = "1.6.0" }, implementation = "prefer_rust" },
  completion = {
    list = { selection = { preselect = false, auto_insert = true } },
    documentation = { auto_show = true, auto_show_delay_ms = 50 },
    ghost_text = { enabled = true },
    trigger = { show_in_snippet = true },
    menu = {
      auto_show = true,
      draw = {
        -- We don't need label_description now because label and label_description are already
        -- combined together in label by colorful-menu.nvim.
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          label = {
            text = function(ctx)
              return colorful_menu.blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return colorful_menu.blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
  },
  sources = {
    default = { "lazydev", "conventional_commits", "snippets", "lsp", "path", "buffer" },
    providers = {
      conventional_commits = {
        name = "Conventional Commits",
        module = "blink-cmp-conventional-commits",
        enabled = function()
          return vim.bo.filetype == "gitcommit"
        end,
      },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
        enabled = function()
          return vim.bo.filetype == "lua"
        end,
      },
    },
  },
}
