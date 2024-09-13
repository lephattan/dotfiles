return {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  {
    "kristijanhusak/vim-dadbod-ui",
    config = function()
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_table_helpers = {
        mysql = {
          Count = "Select Count(*) From {table}"
        }
      }
    end
  },
}
