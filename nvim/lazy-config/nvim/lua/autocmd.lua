local api = vim.api
local create_autocmd = api.nvim_create_autocmd

api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' }, {
    pattern = { '*.py' },
    command = [[
  setlocal tabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix colorcolumn=88
  ]]
    -- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
    -- nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
  })

create_autocmd({ 'FileType' }, {
  pattern = { 'vue' },
  command = [[setlocal sts=0 expandtab|set filetype=vue]],
})


create_autocmd({ 'FileType' }, {
  pattern = { 'php' },
  command = [[setlocal ai si]],
})

create_autocmd({ 'FileType' }, {
  pattern = { 'markdown' },
  command = [[setlocal wrap linebreak]],
})

create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.conf.template' },
  command = [[set filetype=conf]],
})

create_autocmd({ 'FileType' }, {
  pattern = { 'liquid' },
  command = [[setlocal sts=0 expandtab|set filetype=liquid.html]],
})

-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])