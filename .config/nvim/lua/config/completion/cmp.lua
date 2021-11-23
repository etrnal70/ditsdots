local cmp = require("cmp")
local neogen = require("neogen")
local luasnip = require("luasnip")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Define CompletionItemKind
local item_kinds = {
  Text = " Text",
  Method = " Method",
  Function = "ƒ Function",
  Constructor = " Constructor",
  Field = "識Field",
  Variable = " Variable",
  Class = " Class",
  Interface = "ﰮ Interface",
  Module = " Module",
  Property = " Property",
  Unit = " Unit",
  Value = " Value",
  Enum = "了Enum",
  Keyword = " Keyword",
  Snippet = " Snippet",
  Color = " Color",
  File = " File",
  Reference = "渚Reference",
  Folder = " Folder",
  Constant = " Constant",
  Struct = " Struct",
  Event = "鬒Event",
  Operator = "\u{03a8} Operator",
  TypeParameter = " TypeParameter",
}

cmp.setup({
  documentation = {
    maxwidth = 60,
    maxheight = 20,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = item_kinds[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        path = "[Path]",
        neorg = "[Nrg]",
        buffer = "[Buf]",
        latex_symbols = "[TeX]",
      })[entry.source.name]
      vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
      return vim_item
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if neogen.jumpable() then
        vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-j>"] = cmp.mapping.scroll_docs(2),
    ["<C-k>"] = cmp.mapping.scroll_docs(-2),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    }),
  },
  preselect = require("cmp.types").cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "luasnip", max_item_count = 3 },
    { name = "nvim_lsp" },
    { name = "path" },
  },
})
