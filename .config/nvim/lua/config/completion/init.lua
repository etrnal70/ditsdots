local cmp = require("cmp")
local cmp_compare = require("cmp.config.compare")
local luasnip = require("luasnip")
local utils = require("config.completion.utils")
local configs = require("config.completion.configs")

--- @diagnostic disable-next-line
cmp.setup({
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
  mapping = cmp.mapping.preset.insert({
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
    ["<Space>"] = cmp.mapping(function(fallback)
      local entry = cmp.get_selected_entry()
      if entry then
        cmp.confirm()
      else
        fallback()
      end
    end),
  }),
  preselect = require("cmp.types").cmp.PreselectMode.None,
  sorting = {
    comparators = {
      cmp_compare.recently_used,
      cmp_compare.locality,
      cmp_compare.score,
      cmp_compare.offset,
      cmp_compare.order,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "luasnip", max_item_count = 2, option = { show_autosnippets = true } },
    { name = "nvim_lsp" },
    { name = "path" },
  },
  window = {
    documentation = {
      max_width = 55,
      max_height = 20,
    },
  },
})

-- Custom filetype options
cmp.event:on("confirm_done", utils.on_confirm_done)

-- Try to append space after completion
cmp.event:on("confirm_done", utils.append_space)

-- Additional configs
configs.load_autopairs()
configs.load_luasnip()
require("config.completion.filetypes")
