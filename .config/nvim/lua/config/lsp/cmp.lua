local cmp = require("cmp")
local npairs = require("nvim-autopairs")
local conds = require("nvim-autopairs.conds")
local rule = require("nvim-autopairs.rule")
local neogen = require("neogen")

-- Vsnip Location
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
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
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = item_kinds[vim_item.kind]
      return vim_item
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-n>"), "n")
      elseif neogen.jumpable() then
        vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
      elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
        return vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
      elseif check_back_space() then
        vim.fn.feedkeys(t("<Tab>"), "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-p>"), "n")
      elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev)"), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-k>"] = cmp.mapping.scroll_docs(2),
    ["<C-j>"] = cmp.mapping.scroll_docs(-2),
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
  sources = {
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "neorg" },
    { name = "path" },
  },
})

-- nvim-autopairs
npairs.setup({
  disable_filetype = { "TelescopePrompt" },
  enable_moveright = true,
  enable_afterquota = true,
  enable_check_bracket_line = true,
  check_ts = true,
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
  map_complete = true,
  auto_select = false,
})

-- Custom Rules (might be refactored to new file)
npairs.add_rules({
  rule("$", "$", { "tex", "latex" })
    :with_pair(conds.not_after_regex_check("%%"))
    :with_pair(conds.not_before_regex_check("xxx", 3))
    :with_move(conds.none())
    :with_del(conds.not_after_regex_check("xx"))
    :with_cr(conds.none()),
})

npairs.add_rules({
  rule("$$", "$$", "tex"):with_pair(function(opts)
    print(vim.inspect(opts))
    if opts.line == "aa $$" then
      return false
    end
  end),
})

--[[ _G.MUtils = {}

MUtils.completion_confirm = function()
  return npairs.autopairs_cr()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true }) ]]
