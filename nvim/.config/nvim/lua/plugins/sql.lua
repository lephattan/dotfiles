return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_execute_on_save = 0
    vim.g.db_ui_table_helpers = {
      mysql = {
        Count = "Select Count(*) From {table}"
      }
    }
    local keymap = vim.keymap.set
    keymap('n', '<leader>uu', '<cmd>DBUIToggle<cr>', { desc = "DBUI Toggle" })
    keymap('n', '<leader>uf', '<cmd>DBUIFindBuffer<cr>', { desc = "DBUI Find Buffer" })
    keymap('n', '<leader>uf', '<cmd>DBUILastQueryInfo<cr>', { desc = "DBUI Last Query Info" })
  end,
  config = function()
  end
}
