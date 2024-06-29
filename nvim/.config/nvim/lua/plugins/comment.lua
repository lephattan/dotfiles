return {
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
    -- Todo comments
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  }
}
