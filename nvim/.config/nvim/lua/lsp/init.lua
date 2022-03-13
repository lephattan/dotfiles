local M = {}


function M.setup()
  local servers = {
    pyright = {},
    intelephense = {},
    cssls = {},
    vuels = {},
    tsserver = {},
    tailwindcss = {},
    html = {},
    vimls = {},
  }

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  end

  local nvim_lsp = require('lspconfig')

  for server, _ in pairs(servers) do
    nvim_lsp[server].setup {
      on_attach = on_attach,
      flags = { 
        debounce_text_changes = 150,
      },
      capabilities = capabilities,
    }
  end
end

return M
