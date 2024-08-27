return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'SirVer/ultisnips',                    -- snippets
      'quangnguyen30192/cmp-nvim-ultisnips', -- snippet integration
      { "windwp/nvim-autopairs", opts = {} },

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'ray-x/cmp-treesitter',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end
        },
        mapping = {
          ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ['<C-y>'] = cmp.mapping(cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }, { 'i', 'c' }),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- ['<CR>'] = cmp.mapping.confirm({
          --   select = true,
          --   behavior = cmp.ConfirmBehavior.Insert,
          -- }),
        },
        sources = cmp.config.sources({
          { name = 'ultisnips' },
          { name = 'nvim_lsp', },
          { name = 'buffer',                 keyword_length = 3, max_item_count = 2 },
          { name = 'path' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'treesitter' },
          -- {name = 'nvim_lua'},
        }),
        window = {
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
          },
          completion = {
            -- rounded border; thin-style scrollbar
            border = 'rounded',
            scrollbar = '║',
          },
        },
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
      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        },
        mapping = cmp.mapping.preset.cmdline(),
      })
      -- Autopairs hook
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      -- Setup up vim-dadbod
      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end
  },
  {
    "mattn/emmet-vim",
    -- TODO: set g:user_emmet_settings
  },
}
