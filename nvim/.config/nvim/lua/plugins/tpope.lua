local keymap = vim.keymap.set

return {
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
}
