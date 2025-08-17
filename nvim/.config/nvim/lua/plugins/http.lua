return {
  {
    "nvim-neotest/nvim-nio",
    lazy = true
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
    config = function()
      vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = "[R]est [r]un under cursor" })
      vim.keymap.set("n", "<leader>rl", "<cmd>Rest last<CR>", { desc = "[R]est run [l]ast request" })
      vim.keymap.set("n", "<leader>rs", "<cmd>Rest env select<CR>", { desc = "[R]est env [s]elect " })
    end,
    lazy = true
  },
}
