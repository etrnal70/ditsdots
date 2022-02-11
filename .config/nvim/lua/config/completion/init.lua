local cmp = require("cmp")
local cmp_compare = require("cmp.config.compare")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local neogen = require("neogen")
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local concat_str = function(str)
  if string.len(str) > 35 then
    return string.sub(str, 1, 20) .. "..." .. string.sub(str, -12)
  end
  return str
end

-- Define CompletionItemKind
local item_kinds = {
  Text = " Text",
  Method = " Method",
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
  TypeParameter = "ﰠ TypeParameter",
}

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  documentation = {
    maxwidth = 60,
    maxheight = 20,
  },
  enabled = function()
    local context = require("cmp.config.context")
    -- Disable completion on comment
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = item_kinds[vim_item.kind]
      vim_item.abbr = concat_str(vim_item.abbr)
      return vim_item
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif neogen.jumpable() then
        neogen.jump_next()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif neogen.jumpable(-1) then
        neogen.jump_prev()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-j>"] = cmp.mapping.scroll_docs(2),
    ["<C-k>"] = cmp.mapping.scroll_docs(-2),
    ["<C-y>"] = cmp.config.disable,
    ["<Space>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if entry then
          cmp.confirm()
        end
      end
      fallback()
    end),
  },
  preselect = require("cmp.types").cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sorting = {
    comparators = {
      function(...)
        return require("cmp_buffer"):compare_locality(...)
      end,
      cmp_compare.offset,
      cmp_compare.exact,
      cmp_compare.score,
      cmp_compare.recently_used,
      cmp_compare.kind,
      cmp_compare.sort_text,
      cmp_compare.length,
      cmp_compare.order,
    },
  },
  sources = {
    { name = "luasnip", max_item_count = 3 },
    { name = "nvim_lsp" },
    { name = "buffer", max_item_count = 2 },
    { name = "path" },
  },
})

-- Customization
-- TeX function use curly braces
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "{" } }))

-- Trigger autocomplete only when typing
function _G.on_complete_check()
  local line = vim.api.nvim_get_current_line()
  local cursor = vim.api.nvim_win_get_cursor(0)[2]

  local current = string.sub(line, cursor, cursor + 1)
  if current == "." or current == "," or current == " " then
    cmp.close()
  end

  local before_line = string.sub(line, 1, cursor + 1)
  local after_line = string.sub(line, cursor + 1, -1)
  if not string.match(before_line, "^%s+$") then
    if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
      cmp.complete()
    end
  end
end
vim.api.nvim_command("autocmd TextChangedI, TextChangedP * call v:lua.on_complete_check()")

-- Setup additional configs
require("config.completion.autopairs")
require("config.completion.autocmd")
