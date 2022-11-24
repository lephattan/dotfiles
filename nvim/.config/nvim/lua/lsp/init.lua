local M = {}


function M.setup()
  local servers = {
    pyright = {},
    intelephense = {},
    cssls = {},
    -- vuels = {},
    volar = {
      filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    },
    tsserver = {},
    tailwindcss = {},
    html = {},
    vimls = {},
    sumneko_lua = {},
    jsonls = {},
    ccls = {},
    dockerls = {},
  }

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local keymap = require('lsp.mappings')
    keymap.setup(client, bufnr)
  end

  local nvim_lsp = require('lspconfig')
  local options = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }

  for server, option in pairs(servers) do
    local lsp_options = options
    for i = 1, #option do
      table.insert(lsp_options, option[i])
    end
    nvim_lsp[server].setup(lsp_options)
  end

  --require('nlua.lsp.nvim').setup(require('lspconfig'), {
  --  on_attach = on_attach,
  --})

end

return M
