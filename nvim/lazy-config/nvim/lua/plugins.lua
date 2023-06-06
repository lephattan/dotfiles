local keymap = vim.keymap.set
local helpers = require('helpers')
require('lazy').setup({
  -- All-hail TPope
  {
    'tpope/vim-fugitive',
    config = function()
      keymap('n', '<leader>gs', '<cmd>G<cr>', { desc = "[G]it [S]tatus" })
      keymap('n', '<leader>gl', '<cmd>G log<cr>', { desc = "[G]it [L]og" })
    end
  },
  'tpope/vim-sleuth',
  'tpope/vim-surround',

  {
    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { 'python' }
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
    }
  },

  {
    -- Theme
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = true,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        transparent_background = true,
        flavour = "macchiato",
      })
      vim.cmd.colorscheme "catppuccin-macchiato"
    end
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'SirVer/ultisnips',
      'quangnguyen30192/cmp-nvim-ultisnips',
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
    end
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- theme = 'onedark',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          statusline = { 'NvimTree' }
        }
      },
    },
  },

  {
    -- bufferline
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {}
    -- TODO: config this
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  {
    -- Comment string context
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      }
    end
  },
  {
    -- Comment
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    opts = {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  },
  {
    -- WhichKey
    'folke/which-key.nvim',
    opts = {}
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup({
        defaults = {
          layout_strategy = 'vertical',
          layout_config = { height = 0.95 },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
              ["<esc>"] = actions.close,
            },
          }
        },
      })
      keymap('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind files' })
      keymap('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
      keymap('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind [B]uffers' })
      keymap('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp tags' })
      keymap('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = '[F]ind [T]ODOS' })
      keymap('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
      keymap('n', '<leader>fs', function()
        local status, search = pcall(vim.fn.input, "Grep > ");
        if status then
          require('telescope.builtin').grep_string({ search = search });
        end
      end, { desc = '[F]ind [S]tring' })
      keymap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      keymap('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    -- Todo comments
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    config = function()
      require("trouble").setup {}
      keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = "Toggle [X]Trouble" })
      keymap('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>',
        { desc = "Toggle [X]Trouble [W]orkspace" })
      keymap('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { desc = "Toggle [X]Trouble [D]ocument" })
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      keymap('n', '<C-n>', ':NvimTreeToggle<cr>', { desc = "Toggle NvimTree" })
      require 'nvim-tree'.setup {
        git                 = {
          ignore = false,
        },
        actions             = {
          open_file = {
            quit_on_open = true,
            window_picker = {
              enable = true,
              exclude = {
                filetype = { 'notify', 'packer', 'qf' },
                buftype = { 'terminal' }
              },
            },
            resize_window = false,
          }
        },
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_tab         = false,
        hijack_cursor       = false,
        update_cwd          = true,
        diagnostics         = {
          enable = false,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          }
        },
        update_focused_file = {
          enable      = true,
          update_cwd  = true,
          ignore_list = {}
        },
        system_open         = {
          cmd  = nil,
          args = {}
        },
        filters             = {
          dotfiles = false,
          custom = {}
        },
        view                = {
          width = 40,
          -- height = 30,
          hide_root_folder = false,
          side = 'left',
          --auto_resize = false,
          mappings = {
            custom_only = false,
            list = {}
          }
        },
        renderer            = {
          indent_markers = {
            enable = true,
          },
        },
      }
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.black,
          null_ls.builtins.code_actions.eslint_d,
        },
      })
    end
  },

  require 'lsp-debug',
  require 'autoformat',
}, {})
