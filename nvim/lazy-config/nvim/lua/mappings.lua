local keymap = vim.keymap.set

keymap('n', '<leader>5', ':exe "vertical resize ".&columns*1/2<cr>', { desc = "Resize to [5]0% width" })
keymap('n', '<leader>=', ':resize +5<cr>', { desc = "[=] Horizontal expand by 5 cols" })
keymap('n', '<leader>-', ':resize -5<cr>', { desc = "[-] Horizontal shrink by 5 cols" })
keymap('i', '<C-c>', '<Esc>', { desc = "Ctr-c to exit insert mode" })
keymap('t', '<esc>', '<C-\\><C-n>', { desc = "[Esc] to exit insert in term" })
keymap('n', '<leader>s', '<cmd>so $XDG_CONFIG_HOME/nvim/init.lua<CR>', { desc = "[S]ource config file" })
