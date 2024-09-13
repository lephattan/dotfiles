return {
  {
    "rest-nvim/rest.nvim",
    config = function()
      vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = "[R]est [r]un under cursor" })
      vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<CR>", { desc = "[R]est run [l]ast request" })
      vim.keymap.set("n", "<leader>rs", "<cmd>Rest env select<CR>", { desc = "[R]est env [s]elect " })
    end
  }
}
