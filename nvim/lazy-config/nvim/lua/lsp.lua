local nmap = require("helpers").nmap
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<CR>', { desc = '[L]SP [I]nfo' })
vim.keymap.set('n', '<leader>lr', '<cmd>LspRestart<CR>', { desc = '[L]SP [R]estart' })

-- Key maps
local on_attach = function(_, buffer)
  -- Diagnostic keymaps
  nmap('K', vim.lsp.buf.hover, "LSP: Hover document", buffer)
  nmap('<c-k>', vim.lsp.buf.signature_help, "LSP: Signature help", buffer)

  nmap('<leader>rn', vim.lsp.buf.rename, 'LSP: [R]e[n]ame', buffer)
  nmap('<leader>ca', vim.lsp.buf.code_action, 'LSP: [C]ode [A]ction', buffer)

  nmap('gd', vim.lsp.buf.definition, 'LSP: [G]oto [D]efinition', buffer)
  nmap('gD', vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration', buffer)
  nmap('gr', require('telescope.builtin').lsp_references, 'LSP: [G]oto [R]eferences', buffer)
  nmap('gI', vim.lsp.buf.implementation, 'LSP: [G]oto [I]mplementation', buffer)
  nmap('gt', vim.lsp.buf.type_definition, 'LSP: [G]oto [T]ype Definition', buffer)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'LSP: [D]ocument [S]ymbols', buffer)
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'LSP: [W]orkspace [S]ymbols', buffer)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(buffer, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- Popup windows border
  require('lspconfig.ui.windows').default_options.border = 'rounded'
end

require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'


local servers = {
  pyright = {},
  intelephense = {},
  cssls = {},
  -- vuels = {},
  volar = {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  },
  html = {},
  vimls = {},
  lua_ls = {},
  jsonls = {},
  -- ccls = {}, -- NOTE: Not valid server name??
  dockerls = {},
  bashls = {},
  rust_analyzer = {
    -- cmd = { 'rustup', "run", "stable", "rust-analyzer" }
  },
  tsserver = {},
  tailwindcss = {},
}

local ext_servers = {
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}
servers = vim.tbl_extend('force', servers, ext_servers)

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
