local keymap = vim.keymap.set
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
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',


  {
    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      { 'nvim-treesitter/nvim-treesitter-context' },
    },
    event = "VeryLazy",
    build = ':TSUpdate',
    config = function()
      local opts = {
        ensure_installed = {
          'arduino',
          'awk',
          'bash',
          'c',
          'cmake',
          'comment',
          'cpp',
          'css',
          'diff',
          'dockerfile',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'gotmpl',
          'gowork',
          'html',
          'htmldjango',
          'ini',
          'javascript',
          'jq',
          'jsdoc',
          'json',
          'json5',
          'jsonnet',
          'lua',
          'luadoc',
          'make',
          'markdown',
          'markdown_inline',
          'mermaid',
          'php',
          'php_only',
          'phpdoc',
          'printf',
          'proto',
          'python',
          'regex',
          'rust',
          'scss',
          'ssh_config',
          'svelte',
          'templ',
          'todotxt',
          'toml',
          'tsv',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'vue',
          'xml',
          'yaml',
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
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
      require("nvim-treesitter.configs").setup(opts)

      -- Go templ files syntax hightlight
      local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
      parser_config.gotmpl = {
        install_info = {
          url = "https://github.com/ngalaiko/tree-sitter-go-template",
          files = { "src/parser.c" }
        },
        filetype = "gotmpl",
        used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", }
      }
    end
  },
  {
    -- Theme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        transparent_background = true,
        term_colors = true,
        flavour = "mocha",
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          fidget = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          markdown = true,
          dap = true,
        },
      })
    end
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        config = true,
        opts = {
          ui = { border = "rounded" }
        }
      },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = { window = { blend = 0, border = "none" }, align = { bottom = false }, }, },

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
        theme = "gruvbox",
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          statusline = { 'NvimTree' }
        }
      },
      sections = {
        lualine_x = { 'rest', 'encoding', 'fileformat', 'filetype' },
      }
    },
  },

  {
    -- bufferline
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    tag = "v4.5.3",
    opts = {
      options = {
        indicator = {
          style = "underline"
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
          }
        },
        numbers = "buffer_id"
      },
    }
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      debounce = 100,
      indent = { char = "|" },
      whitespace = { highlight = { "Whitespace", "NonText" } },
    },
    main = "ibl"
  },
  {
    -- Comment string context
    'JoosepAlviste/nvim-ts-context-commentstring',
    -- config = function()
    --   require 'nvim-treesitter.configs'.setup {
    --     enable_autocmd = false,
    --     languages = {
    --       typescript = '// %s',
    --     },
    --   }
    -- end
  },
  {
    -- Comment
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
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
        vim.ui.input({
            prompt = "Grep > ",
          },
          function(input)
            if input then
              require('telescope.builtin').grep_string({ search = input });
            end
          end
        )
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
          side = 'left',
          --auto_resize = false,
          -- view.mappings is deprecated
          -- mappings = {
          --   custom_only = false,
          --   list = {}
          -- }
        },
        renderer            = {
          indent_markers = {
            enable = true,
          },
          root_folder_label = false,
        },
      }
    end
  },
  {
    -- 'jose-elias-alvarez/null-ls.nvim',
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvimtools/none-ls-extras.nvim' },
    config = function()
      local null_ls = require('null-ls')

      local function style50()
        local h = require("null-ls.helpers")
        local methods = require("null-ls.methods")
        local FORMATTING = methods.internal.FORMATTING
        local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

        return h.make_builtin {
          name = "style50_format",
          meta = {},
          method = { FORMATTING, RANGE_FORMATTING },
          filetypes = { "c" },
          generator_opts = {
            command = "clang-format",
            -- args = {
            --   "-style={ AllowShortFunctionsOnASingleLine: Empty, BraceWrapping: { AfterCaseLabel: true, AfterControlStatement: true, AfterFunction: true, AfterStruct: true, BeforeElse: true, BeforeWhile: true }, BreakBeforeBraces: Custom, ColumnLimit: 132, IndentCaseLabels: true, IndentWidth: 4, SpaceAfterCStyleCast: true, TabWidth: 4 }",
            --   "-assume-filename", "$FILENAME",
            --   "--offset",
            --   "--length",
            -- },
            args = h.range_formatting_args_factory(
              { "-assume-filename", "$FILENAME",
                "-style",
                "{ AllowShortFunctionsOnASingleLine: Empty, BraceWrapping: { AfterCaseLabel: true, AfterControlStatement: true, AfterFunction: true, AfterStruct: true, BeforeElse: true, BeforeWhile: true }, BreakBeforeBraces: Custom, ColumnLimit: 132, IndentCaseLabels: true, IndentWidth: 4, SpaceAfterCStyleCast: true, TabWidth: 4 }" },
              "--offset",
              "--length",
              { use_length = true, row_offset = -1, col_offset = -1 }
            ),
            to_stdin = true,
          },
          factory = h.formatter_factory,
        }
      end

      null_ls.setup({
        sources = {
          require("none-ls.diagnostics.flake8"),
          require("none-ls.code_actions.eslint_d"),
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettierd.with { disabled_filetypes = { 'html' } },
          null_ls.builtins.formatting.black,
          style50,
        },
      })
    end
  },
  {
    'mhinz/vim-startify'
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      -- TODO: set keymaps for this
      -- keymap('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Jump to left pane" })
      -- keymap('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Jump to right pane" })
      -- keymap('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Jump to below pane" })
      -- keymap('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Jump to upper pane" })
    end
  },
  {
    "raimon49/requirements.txt.vim"
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = "markdown",
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      keymap('n', "gh1", function() ui.nav_file(1) end, { desc = "[g]o to [h]arpoon file id [1]" })
      keymap('n', "gh2", function() ui.nav_file(2) end, { desc = "[g]o to [h]arpoon file id [2]" })
      keymap('n', "gh3", function() ui.nav_file(3) end, { desc = "[g]o to [h]arpoon file id [3]" })
      keymap('n', "gh4", function() ui.nav_file(4) end, { desc = "[g]o to [h]arpoon file id [4]" })
    end
  },
  {
    "fatih/vim-go",
  },
  {
    "joerdav/templ.vim"
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'dirvish',
          'fugitive',
          'NvimTree',
          'harpoon',
        },
      })
      vim.cmd("hi IlluminatedWordRead guibg=#525252 gui=none")
      vim.cmd("hi IlluminatedWordText guibg=#525252 gui=none")
    end
  },
  {
    "mattn/emmet-vim",
  },
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        relative = "editor",
      }
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {},
      config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        require("oil").setup()
      end
    },
    {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
      opts = {
        -- this does not work, have to install rocks manually
        -- rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
      }
    },
    {
      "rest-nvim/rest.nvim",
      ft = "http",
      dependencies = { "luarocks.nvim", },
      config = function()
        require("rest-nvim").setup({})

        require("telescope").load_extension("rest")
        keymap("n", "<localleader>rr", "<cmd>Rest run<cr>", { desc = "[R]est [r]un under cursor" })
        keymap("n", "<localleader>re", "<cmd>Telescope rest select_env<cr>", { desc = "[R]est [E]nv" })
        keymap("n", "<localleader>rl", "<cmd>Rest run last<cr>", { desc = "[R]est re-run [l]ast request" })
        keymap("n", "<localleader>rs", "<cmd>Rest result next<cr>", { desc = "[R]est re[s]ult next" })
        keymap("n", "<localleader>rp", "<cmd>Rest result prev<cr>", { desc = "[R]est result [p]rev" })
      end,
    },
  },

  require 'lsp-debug',
  require 'autoformat',
}, {
  ui = {
    border = "rounded"
  }
})
