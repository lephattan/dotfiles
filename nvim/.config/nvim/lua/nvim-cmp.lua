-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs( -4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-y>'] = cmp.mapping(cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }, { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
  },
  sources = {
    { name = 'ultisnips' },
    { name = 'buffer',                 keyword_length = 3, max_item_count = 2 },
    { name = 'nvim_lsp', },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
    -- {name = 'treesitter'},
    -- {name = 'nvim_lua'},
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
    },
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  },
  mapping = cmp.mapping.preset.cmdline(),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  },
    {
      { name = 'cmdline' }
    }),
  mapping = cmp.mapping.preset.cmdline(),
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
