local keymap = vim.keymap.set

return {
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
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
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  }
}
