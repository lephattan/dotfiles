local keymap = vim.keymap.set

return {
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        keymap('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        keymap('n', '<leader>gn', require('gitsigns').next_hunk,
          { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        keymap('n', '<leader>ph', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = '[P]review [H]unk' })
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
    -- tag = "v4.5.3",
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
    'mhinz/vim-startify'
  },
  {
    -- winbar
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    event = "BufEnter",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
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
    "stevearc/dressing.nvim",
    opts = {
      input = {
        relative = "editor",
      }
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  -- {
  --   "rcarriga/nvim-notify",
  --   even = "VeryLazy",
  --   opts = {
  --     background_colour = "#000000",
  --     top_down = false
  --   }
  -- }
}
