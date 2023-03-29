local dap = require('dap')
local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
dap.adapters.rust = function(callback, config)
  local rust_dap_opts = {
    type = 'server',
    port = "${port}",
    executable = {
      command = codelldb_path,
      args = { "--port", "${port}" },
    }
  }
  print("Compiling...")
  local compile_cmd = "cargo build"
  local handle = assert(io.popen(compile_cmd, "r"))
  local s = assert(handle:read("*a"))
  handle:close()
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  print("Compiling completed!")
  callback(rust_dap_opts)
end

dap.configurations.rust = {
  {
    name = "Launch debug",
    type = "rust",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
  {
    name = "Launch file",
    type = "rust",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
