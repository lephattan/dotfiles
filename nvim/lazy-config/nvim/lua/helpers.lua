local M = {}
function M.nmap(keys, func, desc, buffer)
  local opts = {}
  if desc then
    opts.desc = '' .. desc
  end
  if buffer then
    opts.buffer = buffer
  end
  vim.keymap.set('n', keys, func, opts)
end

return M
