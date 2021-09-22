local cmp = require("cmp")
local neogen = require("neogen")

-- Vsnip Location
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Define CompletionItemKind
local item_kinds = {
  Text = "",
  Method = "",
  Function = "ƒ",
  Constructor = "",
  Field = "識",
  Variable = "",
  Class = "",
  Interface = "ﰮ",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "了",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "渚",
  Folder = "",
  Constant = "",
  Struct = "",
  Event = "鬒",
  Operator = "\u{03a8}",
  TypeParameter = "",
}

cmp.setup({
  completion = {
    keyword_length = 1,
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = item_kinds[vim_item.kind]
      return vim_item
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function()
      --[[ if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-n>"), "n") ]]
      if cmp.visible() then
        cmp.select_next_item()
      else
        vim.fn.feedkeys(t("<Plug>(Tabout)"), "")
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function()
      --[[ if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-p>"), "n") ]]
      if cmp.visible() then
        cmp.select_prev_item()
      else
        vim.fn.feedkeys(t("<Plug>(TaboutBack)"), "")
      end
    end, {
      "i",
      "s",
    }),
    ["<C-k>"] = cmp.mapping.scroll_docs(2),
    ["<C-j>"] = cmp.mapping.scroll_docs(-2),
    ["<C-l>"] = cmp.mapping(function()
      if neogen.jumpable() then
        vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
      elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
      end
    end, {
      "i",
      "s",
    }),
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn.call("vsnip#jumpable", { 1 }) == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev"), "")
      end
    end, {
      "i",
      "s",
    }),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    }),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sorting = {
    comparators = {
      cmp.config.compare.score,
      cmp.config.compare.offset,
    },
  },
  sources = {
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "path" },
  },
})
