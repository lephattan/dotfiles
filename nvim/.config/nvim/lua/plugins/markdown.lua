return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = "markdown",
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway
    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("markview").setup({
        -- headings = {
        --   heading_2 = {
        --     padding_left = " ",
        --   },
        --   heading_3 = {
        --     padding_left = " ",
        --   },
        --   heading_4 = {
        --     padding_left = " ",
        --   },
        -- },
        preview = {
          modes = { "n", "no", "c", "i" }, -- Change these modes to what you need
          hybrid_modes = { "n", "i" },   -- Uses this feature on normal mode
          callbacks = {
            on_enable = function(_, win)
              vim.wo[win].conceallevel = 2;
              vim.wo[win].conecalcursor = "c";
            end
          }
        }
        -- This is nice to have
      })
    end,
  },
}
