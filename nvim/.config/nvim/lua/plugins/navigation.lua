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
        win_options = {
          winbar =
          "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . v:lua.vim.fn.getcwd(), '.', '')}",
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            return name == '..'
            -- return false
          end,
        },
        keymaps = {
          ["<C-v>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<C-h>"] = false,
          ["gy"] = { "actions.yank_entry", desc = "Yank the filepath of the entry under the cursor to a register" },
          ["<C-l>"] = false,
          ["gR"] = { "actions.refresh", desc = "[R]efresh" }
        }
      })
    end
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
      keymap("n", "<c-n>", function() require("edgy").toggle("left") end)
    end,
    opts = {
      left = {
        {
          ft = "trouble",
          pinned = true,
          title = "Symbols",
          filter = function(_buf, win)
            return vim.w[win].trouble.mode == "symbols"
          end,
          open = "Trouble symbols position=left focus=false filter.buf=0",
          size = { height = 0.6 },
        },
        {
          ft = "trouble",
          pinned = true,
          title = "Trouble",
          filter = function(_buf, win)
            return vim.w[win].trouble.mode == "diagnostics"
          end,
          open = "Trouble diagnostics focus=false filter.severity=vim.diagnostic.severity.ERROR",
          size = { height = 0.4 },
        },
      }
    }
  },
}
