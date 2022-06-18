local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local kind_icons = {
  Text = "₸",
  Method = "m",
  Function = "⨍",
  Constructor = "🛠",
  Field = "",
  Variable = "",
  Class = "🖧",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "🔑",
  Snippet = "",
  Color = "",
  File = "🖹",
  Reference = "",
  Folder = "📁",
  EnumMember = "",
  Constant = "ℇ",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "ナ",
}

cmp.setup {
  view = {
    entries = "custom"
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    -- scroll popup
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    -- scroll docs
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    -- trigger completion
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },

    -- Super tab!!
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- Labels
      vim_item.menu = ({
        nvim_lsp = "[L]",
        buffer = "[B]",
        cmp_tabnine = "[9]",
        path = "[P]",
        spell = "[S]",
        luasnip = "[L]",
        emoji = "[💻]",
        cmdline = "[cmd]",
        nvim_lsp_signature_help = "[H]",
        latex_symbols = "[X]",
      })[entry.source.name]
      return vim_item
    end,
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "cmp_tabnine" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = 'spell' },
    { name = 'emoji' },
    { name = "path" },
    { name = "cmdline" },
    { name = "nvim_lsp_signature_help" },
    { name = "latex_symbols" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  -- cmp window colors
  window = {
    documentation = {
      border = 'rounded',
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:CursorLine,Search:None',
      zindex = 1001,
      col_offset = 0,
      side_padding = 1
    },
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:CursorLine,Search:None',
      zindex = 1001,
      col_offset = 0,
      side_padding = 1
    },
  },
}
