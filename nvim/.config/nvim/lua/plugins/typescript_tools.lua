local nmap = require("helpers").nmap
local imap = require("helpers").imap

local on_attach = function(client, buffer)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  -- Diagnostic keymaps
  nmap('K', vim.lsp.buf.hover, "LSP: Hover document", buffer)
  -- nmap('<c-h>', vim.lsp.buf.signature_help, "LSP: Signature [h]elp", buffer)
  imap('<c-h>', vim.lsp.buf.signature_help, "LSP: Signature [h]elp", buffer)

  nmap('<leader>rn', vim.lsp.buf.rename, 'LSP: [R]e[n]ame', buffer)
  nmap('<leader>ca', vim.lsp.buf.code_action, 'LSP: [C]ode [A]ction', buffer)

  nmap('gd', vim.lsp.buf.definition, 'LSP: [G]oto [D]efinition', buffer)
  nmap('gD', vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration', buffer)
  nmap('gr', require('telescope.builtin').lsp_references, 'LSP: [G]oto [R]eferences', buffer)
  nmap('gI', vim.lsp.buf.implementation, 'LSP: [G]oto [I]mplementation', buffer)
  -- nmap('gt', vim.lsp.buf.type_definition, 'LSP: [G]oto [T]ype Definition', buffer)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'LSP: [D]ocument [S]ymbols', buffer)
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'LSP: [W]orkspace [S]ymbols', buffer)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(buffer, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- Popup windows border
  require('lspconfig.ui.windows').default_options.border = 'rounded'
end

return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    on_attach = on_attach,
    settings = {
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      }
    }
  },
}
