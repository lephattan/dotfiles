local keymap = vim.keymap.set

return {
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
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      require("oil").setup({
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            return name == '..'
            -- return false
          end,
        }
      })
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    lazy = true,
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
}
