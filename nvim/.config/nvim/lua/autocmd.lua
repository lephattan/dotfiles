local api = vim.api
local create_autocmd = api.nvim_create_autocmd
local create_augroup = api.nvim_create_augroup

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
create_autocmd({ 'FileType' }, {
  pattern = { 'yaml' },
  command = [[ setlocal tabstop=2 shiftwidth=2 expandtab ]],
})

-- create_autocmd({ 'FileType' }, {
--   pattern = { 'typescript' },
--   command = [[ set filetype=typescriptreact]],
-- })

create_autocmd({ 'FileType' }, {
  pattern = { 'c' },
  command = [[ set tabstop=4 shiftwidth=4]],
})

create_autocmd({ 'FileType' }, {
  pattern = { 'dap-float', },
  command = [[
  setlocal wrap
  nnoremap <buffer><silent> q :q<cr>
  ]],
})

create_autocmd({ 'FileType' }, {
  pattern = { 'git', 'fugitive' },
  command = [[
  nnoremap <buffer><silent> q :q<cr>
  ]],
})


create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { '*.tmpl' },
  command = [[
  setlocal filetype=gotmpl
  ]],
})

create_autocmd({ "BufWritePost" }, {
  pattern = { ".tmux.conf" },
  callback = function()
    vim.notify("reload tmux conf file", nil, {})
    vim.fn.jobstart("tmux source-file ~/.tmux.conf")
  end

})

-- Set json filetype formatter to `jq`
-- a work around for rest.nvim due to an issue in json response formating
-- @link https://github.com/rest-nvim/rest.nvim/issues/414
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(ev)
    -- vim.bo.formatexpr = "v:lua.vim.lsp.formatexpr()"
    vim.bo[ev.buf].formatprg = "jq"
  end,
})

api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' }, {
    pattern = { '*.go' },
    command = [[ setlocal colorcolumn=80 ]]
  })

create_autocmd({ 'FileType' }, {
  pattern = { 'javascript' },
  callback = function()
    vim.fn.setreg("l", 'yiwoconsole.log(pysiw"A, pA)')
  end,
})

local fugitive = create_augroup("fugitive", { clear = true })
create_autocmd(
  { 'FileType' },
  {
    pattern = { 'fugitiveblame' },
    command = [[ setlocal winbar=fugitiveblame ]],
    group = fugitive,
  }
)
