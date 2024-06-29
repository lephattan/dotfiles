local keymap = vim.keymap.set

return {
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
}
