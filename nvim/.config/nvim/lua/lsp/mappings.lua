local M = {}

function M.setup(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap
  local buf_keymap = vim.api.nvim_buf_set_keymap
  -- Key mapping
  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

  -- which-key
  if isModuleAvailable('which-key') then
    local whichkey = require "which-key"
    local keymap_l = {
      l = {
        name = "Code",
        i = { "<cmd>LspInfo<CR>", "LSP Info" },
        r = { '<cmd>LspRestart<CR>', 'LSP Restart' },
        a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions' },
        -- f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', "Format Document" },
        f = { '<cmd>lua vim.lsp.buf.format { async = true }<cr>', 'Format Document' }
      }
    }

    local keymap_g = {
      name = 'Goto',
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
      --R = {"<cmd>TroubleToggle lsp_references<CR>", "References"},
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    }

    whichkey.register(keymap_l, { buffer = bufnr, prefix = '<leader>' })
    whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
  end

end

return M
