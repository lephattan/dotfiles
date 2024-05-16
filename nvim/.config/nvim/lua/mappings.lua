local keymap = vim.keymap.set

-- keymap('n', '<leader>5', ':exe "vertical resize ".&columns*1/2<cr>', { desc = "Resize to [5]0% width" })
-- keymap('n', '<leader>=', ':resize +5<cr>', { desc = "[=] Horizontal expand by 5 cols" })
-- keymap('n', '<leader>-', ':resize -5<cr>', { desc = "[-] Horizontal shrink by 5 cols" })
keymap('i', '<C-c>', '<Esc>', { desc = "Ctr-c to exit insert mode" })
keymap('t', '<esc>', '<C-\\><C-n>', { desc = "[Esc] to exit insert in term" })
keymap('n', '<leader>s', '<cmd>so ~/.config/nvim/init.lua<CR>', { desc = "[S]ource config file" })

-- Navigation
keymap("n", "<C-K>", "<C-W><C-K>", { desc = "Move to upper split" })
keymap("n", "<C-J>", "<C-W><C-J>", { desc = "Move to lower split" })
keymap("n", "<C-H>", "<C-W><C-H>", { desc = "Move to left split" })
keymap("n", "<C-L>", "<C-W><C-L>", { desc = "Move to right split" })

-- Resize
keymap("n", "<leader>=", "<C-w>=", { desc = "Make windows to be the same size" })
-- Sizing split horizontally
-- FIX: why <c-.> and <c-,> don't work
keymap("n", "<C-,>", "<C-W><", { desc = "Shrink split horizontally" })
keymap("n", "<C-.>", "<C-W>>", { desc = "Expand split horizontally" })
keymap("n", "<A-,>", "<C-W>5<", { desc = "Greater shrink split horizontally" })
keymap("n", "<A-.>", "<C-W>5>", { desc = "Greater expand split horizontally" })
-- Sizing window vertically
-- " taller
keymap("n", "<A-t>", "<C-W>+", { desc = "Make split [t]aller" })
-- nnoremap <A-t> <C-W>+
-- " shorter
keymap("n", "<A-s>", "<C-W>-", { desc = "Make split [s]horter" })
-- nnoremap <A-s> <C-W>-
