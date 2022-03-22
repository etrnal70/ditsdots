local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local utils = require("config.completion.utils")
local configs = require("config.completion.configs")

cmp.setup({
  documentation = {
    maxwidth = 60,
    maxheight = 20,
  },
  enabled = function()
    local context = require("cmp.config.context")
    -- Disable completion on comment
    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  end,
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = utils.item_kinds[vim_item.kind]
      vim_item.abbr = utils.concat_str(vim_item.abbr)
      return vim_item
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif utils.has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end),
    ["<C-j>"] = cmp.mapping.scroll_docs(2),
    ["<C-k>"] = cmp.mapping.scroll_docs(-2),
    ["<C-y>"] = cmp.config.disable,
    ["<Space>"] = cmp.mapping(function(fallback)
      local entry = cmp.get_selected_entry()
      if entry then
        cmp.confirm()
        -- Don't try to add space when entry is a snippet
        if not entry.completion_item.insertTextFormat == require("cmp.types.lsp").InsertTextFormat.Snippet then
          local kind = entry:get_kind()
          if utils.allow_append_space(kind) then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Space>", true, true, true), "", true)
          end
        end
      else
        fallback()
      end
    end),
  },
  preselect = require("cmp.types").cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "luasnip", max_item_count = 2 },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "path" },
  },
})

-- TeX function use curly braces
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "{" } }))

-- Additional configs
configs.load_autopairs()
configs.load_luasnip()
require("config.completion.filetypes")
